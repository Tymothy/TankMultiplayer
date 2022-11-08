/// @description Watches for things to happen in game then takes actions


config = {
	map : "",	
	
}

setGameConfig = function(_data) {
	//Set configs, but don't apply yet
	config.map = _data.map;
	
	applyGameConfig();
}


applyGameConfig = function() {
		obj_mapManager.loadMap(config.map);
		
		startGame();
}

startGame = function() {
	//Player should spawn	
	
}

handleGameStatus = function(_data) {
	//TODO: Handle game status sent from server	
	
	switch(_data.gameStatus) {
		case "STARTING":
		
			//Find the spawn point
			switch(obj_self.playerData.team) {
				case TEAM.RED:
					instance_nearest(obj_self.x, obj_self.y, obj_teamSpawn_red)	
					break;
					
				case TEAM.BLUE:
					instance_nearest(obj_self.x, obj_self.y, obj_teamSpawn_blue)	
					break;
			}
			
		
		break;
		
	}
	
}