//Prep the server

const WebSocketServer = require('ws');
const http = require("http")
const https = require("https")
const fs = require("fs")

//Server runs on port 10028, but client communicates over 443.
//NGINX webserver redirects the traffic here
var port = process.env.PORT || 10028;
    var options = {cert: fs.readFileSync('/home/bitnami/gameServer/ssl/server.crt'),
                   key: fs.readFileSync('/home/bitnami/gameServer/ssl/server.key')}
    var httpserver = https.createServer(options, (req, res) => {
			res.writeHead(200);
			res.end('hello world\n');
		})

httpserver.listen(port)

console.log(options);
var wss = new WebSocketServer.Server({server: httpserver });

const gl = require('./gameLogic.js'); //gl is short for game logic
const en = require('./enums.js'); //en short for enum

//Variables to use in game
	playersData = []; //Players array to hold data sent to clients
	attacksData = []; //Array to hold successful attacks against players

	clientID = 0;
	var timeStep = 0;
  var gameState = en.GAME_STATUS.IDLE; //Init

  function serverTimeStep () {
	  //Executes functions on regular intervals
    //Runs every 50 ms by default, which is 20 times a second

    //Excutes every step
    //Run every 5 seconds
    if(timeStep % (20 * 5) == 0) {
      //console.log("===CURRENT SERVER INFO===");
      //console.log("Server game state: " + gameState);
      //console.log("==========================");


      if(gl.getConnectedPlayerCount(playersData) <= 0) {
        gameState = en.GAME_STATUS.IDLE;
      }
  }

    switch (gameState) {
      case en.GAME_STATUS.IDLE:
      //Wait for someone to connect then go to lobby
        if(gl.getConnectedPlayerCount(playersData) > 0) {
          gameState = en.GAME_STATUS.IN_LOBBY;
        }
      break;
      case en.GAME_STATUS.IN_LOBBY:
	      sendPositionUpdates();
        let readyStatus = checkReadyStatus();

        if(readyStatus == true) {
          gameState = en.GAME_STATUS.STARTING;

        }

        //Run every 5 seconds
        if(timeStep % (20 * 5) == 0) {
          gl.logPlayerState();
      }
      break;
      case en.GAME_STATUS.STARTING:
        sendPositionUpdates();
        sendGameConfig();

        gameState = en.GAME_STATUS.PLAYING;

      break;
      case en.GAME_STATUS.PLAYING:
        sendPositionUpdates();

        //Check for game end information


        //Run every 5 seconds
        if(timeStep % (20 * 5) == 0) {
          gl.logPlayerState();
      }
      break;
      case en.GAME_STATUS.ENDING:
        sendPositionUpdates();



      break;



    }


	  timeStep++;
	  //setTimeout(serverTimeStep(), 50); //Steps every 50 ms, or 20 times a second

	};
	function generateClientID() {
		clientID++
		var _ret = clientID;
		return clientID;
	}

	function getPlayer(_clientID){
	//Returns the object held in playersData given a clientID
		for(let i = 0; i < playersData.length; i++) {
			let item = playersData[i];

			if(item.clientID == _clientID){
				return playersData[i];
			}
		}

	}
	//Functions internal to gameLogic.  Not allowed to be called directly outside of this script
	function sendPositionUpdates(){
	  for(let i = 0; i < playersData.length; i++) { //Players we are sending data to
	    for(let j = 0; j < playersData.length; j++) { //Players we are sending data about
	      if(playersData[i].clientID != playersData[j].clientID){
	        //console.log("Oldest player: " + playersData[0].clientID + " X:" + playersData[0].vx + " Y:" + playersData[0].vy);
	        sendEvent(playersData[i].socketObject, en.C_EVENT.UPDATE_POSITION, playersData[j]);
	      }
	    }
	  }
	}

	function assignTeam() {
		var _ret = en.TEAM.BLUE;
		return _ret;
	}

  function checkReadyStatus() {
        let readyCount = 0;
        	for(let i = 0; i < playersData.length; i++) {
            let item = playersData[i];

            if(item.ready == true){
      				readyCount++;
      			  }
            }
      //console.log(readyCount + " players are ready out of " + playersData.length);
    if(readyCount == playersData.length) {
      //All players are ready
        return true;
    }
    else {
      return false;
    }

  }
  function getGameConfig() {
    let gameConfig = {
      map : "map_01",
    }
    return gameConfig;

  }

  function sendGameConfig() {
      //Tell the players the game config
          //Imediately send the fire event to all clients
          let gameConfig = getGameConfig();
          console.log("Sending game config:");
          console.log(gameConfig);
          for(let i = 0; i < playersData.length; i++) {
            sendEvent(playersData[i].socketObject, en.C_EVENT.GAME_CONFIG, gameConfig);
          }
      //Players will find the spawn points on the map and tell the server where they are



  }

  setInterval(serverTimeStep, 50);
		//serverTimeStep();

	// #endregion

	function sendEvent(_ws, _event, _data) {
		//_ws = The socket object of the client we want to send to
		//_event = the event name we want to send to client
		// _data = the data object we want to sent client

		var packet = 0;

		switch(_event) {
			case en.C_EVENT.CREATE_SELF:
				packet = JSON.stringify({
					event: _event,
					timeStep : timeStep,
					clientID: _data.clientID,
					lobby : _data.lobby,
					gameStatus : _data.gameStatus,
					ready : _data.ready,
					name: _data.name,
					x: _data.x,
					y: _data.y,
					a: _data.a,
					hp: _data.hp,
					mx: 0,
					my: 0,
					team: _data.team
				});

				_ws.send(packet);
			break;
			case en.C_EVENT.CREATE_OTHER:
				packet = JSON.stringify({
					event: _event,
					timeStep : timeStep,
					clientID: _data.clientID,
					name: _data.name,
					x: _data.x,
					y: _data.y,
					a: _data.a,
					hp: _data.hp,
					mx: _data.mx,
					my: _data.my,
					team: _data.team
				});

				_ws.send(packet);
			break;
			case en.C_EVENT.DESTROY_OTHER:
				packet = JSON.stringify({
					event: _event,
					clientID: _data.clientID,
					timeStep : timeStep,

				});
				_ws.send(packet);
			break;
			case en.C_EVENT.UPDATE_POSITION:
				packet = JSON.stringify({
					event: _event,
					clientID: _data.clientID,
					timeStep : timeStep,
					x: _data.x,
					y: _data.y,
					a: _data.a,
					vx: _data.vx,
					vy: _data.vy,
					mx: _data.mx,
					my: _data.my,
				});
				_ws.send(packet);
			break;
			case en.C_EVENT.WEAPON_FIRE:
				packet = JSON.stringify({
					event: _event,
					timeStep : timeStep,
					clientID: _data.clientID,
					x: _data.x,
					y: _data.y,
					vx: _data.vx,
					vy: _data.vy,
					mx: _data.mx,
					my: _data.my,
				});
				_ws.send(packet);
			break;
			case en.C_EVENT.DAMAGE:
			let item = getPlayer(_data.hurtID);
				packet = JSON.stringify({
					event: _event,
					timeStep : timeStep,
					hurtID: _data.hurtID,
					hurtHP : item.hp,
					attackerID: _data.attackerID,
					type: _data.type,
					damage: _data.damage,

				});
				_ws.send(packet);
			break;
			case en.C_EVENT.READY:
				//let item = getPlayer(_data.hurtID);

					packet = JSON.stringify({
						event: _event,
						timeStep : timeStep,
						clientID: _data.clientID,
						ready: _data.ready,
					});
					_ws.send(packet);
			break;
			case en.C_EVENT.GAME_CONFIG:
				//We want to send all the players to a specific map and give them
				//Coords to spawn at
        packet = JSON.stringify({
          event: _event,
          timeStep : timeStep,
          map : _data.map,
        });
        _ws.send(packet);
			break;
      case en.C_EVENT.UPDATE_PLAYER:
      //Send a data object of whatever we want to update
      _data['event'] = _event;

        packet = JSON.stringify(
          _data, //Everything in _data will be sent
        );
        console.log(packet);
        _ws.send(packet);
      break;

		}

	}


//Handle messages sent to server C_EVENT
wss.on("connection", ws => {

	//Runs when a message is sent to server
		ws.on("message", data => {
		var jsonData = JSON.parse(data);
		var event = jsonData.data.event;
		var data = jsonData.data;

		switch(event) {
			//Goes directly to the message
			case en.S_EVENT.CREATE_SELF:
				console.log("Create event");
				//We want to create the player on the server and tell the client where they are created at
				team = assignTeam(); //Testing value, needs a function later
				var spawnCoords = gl.getWorldSpawnCoords(team);

				var curPlayer= {
						clientID: generateClientID(),
						name: data.name,
						team : -1,
						lobby : -1,
						gameStatus : en.GAME_STATUS.IDLE,
						ready : false,
						x: spawnCoords.x,
						y: spawnCoords.y,
						a: data.a,
						hp: 3,
						mx: 0,
						my: 0,
						vx: 0,
						vy: 0,
						socketObject: ws,

					};
					playersData.push(curPlayer);

				sendEvent(curPlayer.socketObject, en.C_EVENT.CREATE_SELF, curPlayer);

				//Tell the player about other existing players in world
				for(let i = 0; i < playersData.length; i++) {
					let item = playersData[i];
					// Don't send data about self
					if(item.clientID != curPlayer.clientID){
						//console.log("Sending information about enemy " + item.name + " to " + curPlayer.name);
						sendEvent(curPlayer.socketObject, en.C_EVENT.CREATE_OTHER, playersData[i]);

						//Also send the data about the new player to existing players
						sendEvent(playersData[i].socketObject, en.C_EVENT.CREATE_OTHER, curPlayer);
					}
				}



			break;

			case en.S_EVENT.UPDATE_POSITION:
				//Update the players position on server
				for(let i = 0; i < playersData.length; i++) {
						let item = playersData[i];
						if(item.clientID == data.clientID) {
							playersData[i].x = Math.round(data.x * 100) / 100;
							playersData[i].y = Math.round(data.y * 100) / 100;
							playersData[i].a = Math.round(data.a * 100) / 100;
							playersData[i].vx = Math.round(data.vx * 100) / 100;
							playersData[i].vy = Math.round(data.vy * 100) / 100;
							playersData[i].mx= Math.round(data.mx * 100) / 100;
							playersData[i].my= Math.round(data.my * 100) / 100;
						}
					}
			break;

			case en.S_EVENT.WEAPON_FIRE:
			let firingClient = 0;
				for(let i = 0; i < playersData.length; i++) {
						let item = playersData[i];
						if(item.clientID == data.clientID) {
							playersData[i].x = Math.round(data.x * 100) / 100;
							playersData[i].y = Math.round(data.y * 100) / 100;
							playersData[i].vx = Math.round(data.vx * 100) / 100;
							playersData[i].vy = Math.round(data.vy * 100) / 100;
							playersData[i].mx= Math.round(data.mx * 100) / 100;
							playersData[i].my= Math.round(data.my * 100) / 100;
							firingClient = playersData[i];
							console.log("Client ID: " + playersData[i].clientID + "/ " + playersData[i].name );
						}
					}

					//Imediately send the fire event to all clients
					for(let i = 0; i < playersData.length; i++) {
						sendEvent(playersData[i].socketObject, en.C_EVENT.WEAPON_FIRE, firingClient);
					}

			break;

			case en.S_EVENT.DAMAGE_SELF:
			let damagedClient = 0;
				for(let i = 0; i < playersData.length; i++) {
						let item = playersData[i];
						if(item.clientID == data.hurtID) {
							//This is the client that has been damaged
							damagedClient = playersData[i];

							//log attack data to end of attacksData array
							let j = attacksData.length;
							var attack = {
								hurtID : data.hurtID,
								attackerID : data.attackerID,
								type : data.type,
								damage : data.damage,
							}
							attacksData.push(attack);

							//Reduce attacked player's health by damage
							playersData[i].hp -= attack.damage;
							if(playersData[i] <= 0) {
								playersData[i].hp = 0;
								console.log("ClientID " + playersData[i].hp + " has lost all hp!");
							}
						}
					}

					//Imediately send the fire event to all clients
					for(let i = 0; i < playersData.length; i++) {
						sendEvent(playersData[i].socketObject, en.C_EVENT.DAMAGE, attack);
						console.log("Sending information to " + playersData[i].clientID + "that " + attack.hurtID + " was damaged by " + attack.attackerID);
					}
			break;

			case en.S_EVENT.UPDATE_PLAYER:
			console.log("Player update sent by " + data.clientID);
			let updateClient = {};
				for(let i = 0; i < playersData.length; i++) {
						let item = playersData[i];
						if(item.clientID == data.clientID) {
              //Iterate through data packet and update what is present
              for (var key in data){
                if(data.hasOwnProperty(key)) {
                  console.log(key + " -> " + data[key]);

                  if(key != "event") {
                    console.log("PlayersData["+playersData[i].clientID+"]."+key+" was " + playersData[i].key);
                    playersData[i].key = data[key];
                    updateClient[key] = data[key];
                    console.log("PlayersData["+playersData[i].clientID+"]."+key+" is now " + playersData[i].key);
                  }

                  console.log("Value of updateClient is : "+ JSON.stringify(updateClient));

                }
              }

						}

					}
					for(let i = 0; i < playersData.length; i++) {
						sendEvent(playersData[i].socketObject, en.C_EVENT.UPDATE_PLAYER, updateClient);
					}
			break;

			default:
				console.log("No event matching");
			break;
			} //End switch event

			});//End message

			ws.on("close", () => {
				//Remove a client from the game world
				let deadIndex = 0;
				let deadClientID = 0;
				for(let i = 0; i < playersData.length; i++) {
					if(playersData[i].socketObject == ws) {
						deadIndex = i;
						deadClient = playersData[i];
				}
			}
			playersData.splice(deadIndex, 1);
			for(let i = 0; i < playersData.length; i++) {
				console.log("Sending destroy other event to " + playersData[i].clientID);
				sendEvent(playersData[i].socketObject, en.C_EVENT.DESTROY_OTHER, deadClient);
				}

		});// End close

		ws.oneerror = function() {
			console.log("Some error occured");
		}
	});

console.log("Server started on port " + port);
