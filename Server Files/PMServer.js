// Using websocket for HTML5 game
//Import the required module
const WebSocketServer = require('ws');
const serverPort = 10027
//Creating a new websocket server
const wss = new WebSocketServer.Server({ port: serverPort})

//Create network event enum objects.  This should match GameMaker's NET_EVENT enum
//Server Events
const S_EVENT = {
	CREATE_PLAYER : 0,
	POSITION_UPDATE : 1,
}

//Cleint events
const C_EVENT = {
	CREATE_PLAYER: 0,
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
	
	switch(team){
		case TEAM.RED:
			var _ret = {
				x : 400,
				y: 400,
			}		
		break;
		
		case TEAM.BLUE:
			var _ret = {
				x : 800,
				y: 400,
			}			
		break;
		
		case TEAM.GREEN:
			var _ret = {
				x : 400,
				y:  800,
			}				
		break;
		
		case TEAM.YELLOW:
			var _ret = {
				x : 800,
				y:  800,
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
	console.log("==sendEvent==");
	console.log("Event: " + _event);
	console.log("Data: " + _data);
	console.log("WS: " + _ws);
	console.log("==endSendEvent==");
	_data.socketObject = undefined; //Do not send websocket data to player
	_data.event = _event;
	var packet = JSON.stringify({
		//event: _event,
		data: _data,
	})
	console.log(packet);
	_ws.send(packet);
	console.log("Sent player " + _data.name + " data");
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
		console.log("=== JSON DATA ===");
		console.log(jsonData);
		console.log("=== END OF JSON DATA ===");
		switch(event) {
			case S_EVENT.CREATE_PLAYER:
				console.log("Create event");
				//We want to create the player on the server and tell the client where they are created at
				team = assignTeam(); //Testing value, needs a function later
				var spawnCoords = getWorldSpawnCoords(team);
				
				var playerData = {
						clientID: generateClientID(),
						name: data.name,
						team : team,
						x: spawnCoords.x,
						y: spawnCoords.y,
						health: 3,
						socketObject: ws,
					};
					playersData.push(playerData);

				sendEvent(playerData.socketObject, C_EVENT.CREATE_PLAYER, playerData);		

				
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
	
	