// Using websocket for HTML5 game
//Import the required module
const WebSocketServer = require('ws');
const serverPort = 10027
//Creating a new websocket server
const wss = new WebSocketServer.Server({ port: serverPort})

//Create network event enum objects.  This should match GameMaker's NET_EVENT enum
//Server Events
const S_EVENT = {
	CREATE_SELF: 0,
	POSITION_UPDATE : 1,
}

//Cleint events
const C_EVENT = {
	CREATE_SELF: 0,
	CREATE_OTHER: 1,
}

const TEAM = {
	RED : 0,
	BLUE: 1,
	GREEN: 2,
	YELLOW: 3,	
}

playersData = []; //Players array to hold data sent to clients
clientID = 0;

function logPlayerState() {
	console.log("Player positions:");
	for(let i in players){
		console.log(players[i].id, players[i].name, players[i].x, players[i].y, players[i].A);
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
	for(let i in players){ //Players we are sending data to
		for(let j in players){ //Players we are sending data about
			//if(players[j].id != players[i].id)
			//{
				stringToSend = JSON.stringify({
					//Info about every other player
					eventName: "position_update",
					id: players[j].id,
					x: players[j].x,
					y: players[j].y,
					A: players[j].A,
				});
				players[i].socketObject.send(stringToSend);				
			//}
		}
	}
	setTimeout(sendPositionUpdates, 30);
}

// #region Game Functions
function getWorldSpawnCoords(team){
	
	let randY = Math.floor(Math.random() * 200 - 100);
	let randX = Math.floor(Math.random() * 200 - 100);
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


// #region Server to Client
function sendEvent(_ws, _event, _data) {
	//_ws = The socket object of the client we want to send to
	//_event = the event name we want to send to client
	// _data = the data object we want to sent client

	var packet = 0;
	
	switch(_event) {
		case C_EVENT.CREATE_SELF:
			packet = JSON.stringify({
				event: _event,
				clientID: _data.clientID,
				name: _data.name,
				x: _data.x,
				y: _data.y,
				hp: _data.hp,
				team: _data.team
			});
			
			_ws.send(packet);
		break;
		
		case C_EVENT.CREATE_OTHER:
			packet = JSON.stringify({
				event: _event,
				clientID: _data.clientID,
				name: _data.name,
				x: _data.x,
				y: _data.y,
				hp: _data.hp,
				team: _data.team
			});
			
			_ws.send(packet);		
		break;
		
	}
	
	
	
	//dataToSend.event = _event;
	//var packet = JSON.stringify({
	//	//event: _event,
	//	data: dataToSend,
	//})
	//console.log("==sendEvent==");
	//console.log("Event: " + _event);
	//console.log("Data: " + dataToSend);
	//console.log("==endSendEvent==");
	//console.log(packet);
	//_ws.send(packet);
}
// #endregion

if(playersData.length != 0) {
	logPlayerState();
	//sendPostionUpdates();
}

wss.on("connection", ws => {
		ws.on("message", data => {
		var jsonData = JSON.parse(data);
		var event = jsonData.data.event;
		var data = jsonData.data;
		
		//console.log("Event Name var: ");
		//console.log(eventName);
		//console.log("=== JSON DATA ===");
		//console.log(jsonData);
		//console.log("=== END OF JSON DATA ===");
		switch(event) {
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
						hp: 3,
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
			
			default:
				console.log("No event matching");
			break;
		} //End switch event
					
		});
	
		ws.on("close", () => {
			
		});	
		
		ws.oneerror = function() {
			console.log("Some error occured");
		}
	});
	
console.log("Server started on port " + serverPort);
	
	