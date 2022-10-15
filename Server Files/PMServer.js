// Using websocket for HTML5 game
//Import the required module
const WebSocketServer = require('ws');

//Creating a new websocket server
const wss = new WebSocketServer.Server({ port: 10027})

players = [];//Players array to hold data
clientID = 0;

function logPlayerState() {
	console.log("Player positions:");
	for(let i in players){
		console.log(players[i].id, players[i].name, players[i].x, players[i].y, players[i].A);
	}

	setTimeout(logPlayerState, 5000);
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

if(players.length != 0) {
	logPlayerState();
	sendPostionUpdates();
}

wss.on("connection", ws => {
		ws.on("message", data => {
			
		});
	
		ws.on("close", () => {
			
		});	
		
		ws.oneerror = function() {
			console.log("Some error occured");
		}
	}
	

	
	