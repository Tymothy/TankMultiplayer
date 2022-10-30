
//Prep the server

const WebSocketServer = require('ws');
const http = require("http")
const https = require("https")
const fs = require("fs")
var express = require("express")
var app = express()

const secure = false

//Launch the server up
var port = process.env.PORT || 3000;
app.use(express.static(__dirname + "/"))
//if (!secure){
//    var httpserver = http.createServer(app)
//}else{
    var options = {cert: fs.readFileSync('/home/bitnami/certs/cattailgames-crt.pem'),
                   key: fs.readFileSync('/home/bitnami/certs/cattailgames-key.pem')}
    var server = https.createServer(options, app).listen(port);
//}
//server.listen(port)

console.log(options);
var wss = new WebSocketServer.Server({server: server });


/*
//OLD CODE BELOW
// Using websocket for HTML5 game
//Import the required module
const WebSocketServer = require('ws');
const port = 10027;
//Creating a new websocket server
const wss = new WebSocketServer.Server({ port: port})
*/

	//Create network event enum objects.  This should match GameMaker's NET_EVENT enum
	//Server Events
	const S_EVENT = {
		CREATE_SELF: 0,
		UPDATE_POSITION : 1,
		WEAPON_FIRE: 2,
		DAMAGE_SELF : 3,
	}

	//Cleint events
	const C_EVENT = {
		CREATE_SELF: 0,
		CREATE_OTHER: 1,
		DESTROY_OTHER: 2,
		UPDATE_POSITION: 3,
		WEAPON_FIRE: 4,
		DAMAGE: 5,
	}

	const TEAM = {
		RED : 0,
		BLUE: 1,
		GREEN: 2,
		YELLOW: 3,
	}

	playersData = []; //Players array to hold data sent to clients
	attacksData = []; //Array to hold successful attacks against players
	clientID = 0;
	var timeStep = 0;
	function incrementServerCounter() {
		serverCounter++;
		setTimeout(incrementServerCounter, 10);
	}

	function logPlayerState() {
		console.log("Player positions:");
		for(let i = 0; i < playersData.length; i++) {
			console.log(playersData[i].clientID, playersData[i].name, playersData[i].x, playersData[i].y, playersData[i].a);
		}

		setTimeout(logPlayerState, 5000);
	}

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

	function sendPositionUpdates(){
		for(let i = 0; i < playersData.length; i++) { //Players we are sending data to
			for(let j = 0; j < playersData.length; j++) { //Players we are sending data about
				if(playersData[i].clientID != playersData[j].clientID){
					//console.log("Oldest player: " + playersData[0].clientID + " X:" + playersData[0].vx + " Y:" + playersData[0].vy);
					sendEvent(playersData[i].socketObject, C_EVENT.UPDATE_POSITION, playersData[j]);
				}
			}
		}
	}

	// #region Game Functions
	function getWorldSpawnCoords(team){

		let randY = Math.floor(Math.random() * 500 - 250);
		let randX = Math.floor(Math.random() * 500 - 250);
		switch(team){
			case TEAM.RED:
				var _ret = {
					x : 400 + randX,
					y: 400 + randY,
				}
			break;

			case TEAM.BLUE:
				var _ret = {
					x : 800 + randX,
					y: 400 + randY,
				}
			break;

			case TEAM.GREEN:
				var _ret = {
					x : 400 + randX,
					y:  800 + randY,
				}
			break;

			case TEAM.YELLOW:
				var _ret = {
					x : 800+ randX,
					y:  800+ randY,
				}
			break;

		}

		return _ret;
	}

	function assignTeam() {
		var _ret = TEAM.BLUE;
		return _ret;
	}

	// #endregion

	function sendEvent(_ws, _event, _data) {
		//_ws = The socket object of the client we want to send to
		//_event = the event name we want to send to client
		// _data = the data object we want to sent client

		var packet = 0;

		switch(_event) {
			case C_EVENT.CREATE_SELF:
				packet = JSON.stringify({
					event: _event,
					timeStep : timeStep,
					clientID: _data.clientID,
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

			case C_EVENT.CREATE_OTHER:
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

			case C_EVENT.DESTROY_OTHER:
				packet = JSON.stringify({
					event: _event,
					clientID: _data.clientID,
					timeStep : timeStep,

				});
				_ws.send(packet);
			break;

			case C_EVENT.UPDATE_POSITION:
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

			case C_EVENT.WEAPON_FIRE:
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

			case C_EVENT.DAMAGE:
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
		}

	}

	function serverTimeStep() {
		//Executes functions on regular intervals
		sendPositionUpdates();
		//console.log("Sending update" + Math.floor(Math.random() * 1000));
		timeStep++;
		setTimeout(serverTimeStep, 50); //Steps every 50 ms, or 20 times a second

	}

		serverTimeStep();
		logPlayerState();


wss.on("connection", ws => {
	console.log("A packet was sent to server");
	//Runs when a message is sent to server
		ws.on("message", data => {
		var jsonData = JSON.parse(data);
		var event = jsonData.data.event;
		var data = jsonData.data;

		switch(event) {
			//Goes directly to the message
			case S_EVENT.CREATE_SELF:
				console.log("Create event");
				//We want to create the player on the server and tell the client where they are created at
				team = assignTeam(); //Testing value, needs a function later
				var spawnCoords = getWorldSpawnCoords(team);

				var curPlayer= {
						clientID: generateClientID(),
						name: data.name,
						team : team,
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

				sendEvent(curPlayer.socketObject, C_EVENT.CREATE_SELF, curPlayer);

				//Tell the player about other existing players in world
				for(let i = 0; i < playersData.length; i++) {
					let item = playersData[i];
					// Don't send data about self
					if(item.clientID != curPlayer.clientID){
						//console.log("Sending information about enemy " + item.name + " to " + curPlayer.name);
						sendEvent(curPlayer.socketObject, C_EVENT.CREATE_OTHER, playersData[i]);

						//Also send the data about the new player to existing players
						sendEvent(playersData[i].socketObject, C_EVENT.CREATE_OTHER, curPlayer);
					}
				}



			break;

			case S_EVENT.UPDATE_POSITION:
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

			case S_EVENT.WEAPON_FIRE:
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
						sendEvent(playersData[i].socketObject, C_EVENT.WEAPON_FIRE, firingClient);
					}

			break;

			case S_EVENT.DAMAGE_SELF:
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
						sendEvent(playersData[i].socketObject, C_EVENT.DAMAGE, attack);
						console.log("Sending information to " + playersData[i].clientID + "that " + attack.hurtID + " was damaged by " + attack.attackerID);
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
				sendEvent(playersData[i].socketObject, C_EVENT.DESTROY_OTHER, deadClient);
				}

		});// End close

		ws.oneerror = function() {
			console.log("Some error occured");
		}
	});

console.log("Server started on port " + port);
