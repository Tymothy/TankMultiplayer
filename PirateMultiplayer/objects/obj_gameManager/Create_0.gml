/// @description Watches for things to happen in game then takes actions


config = {
	map : "",	
	
}

setGameConfig = function(_data) {
	//Set configs, but don't apply yet
	config.map = _data.map;
	
	//applyGameConfig();
}


applyGameConfig = function() {
		obj_mapManager.loadMap(config.map);
		
		startGame();
}

startGame = function() {
	//Player should spawn	
	
}

handleGameStatus = function(_data) {
	//Handle variables from data
	data = _data;
	

	//Need to wait for map to be loaded
	
	switch(_data.gameStatus) {
		case "STARTING":
			
			alarmCounterFlag = 0;
			alarm[0] = 1;


		

			
			//Figure out which spawn inst we want since spawn insts exists for both teams
			//var _spawn = instance_nearest(_teamSpawnInst.x, _teamSpawnInst.y, _spawnInst);
			
			//Move obj_self to the spawn point
			//var _array = [_spawn.x, _spawn.y];
			//obj_self.setPosition(_array);
			
			
			////Find the spawn point
			//switch(obj_self.playerData.team) {
			//	case TEAM.RED:
			//		_inst = instance_nearest(obj_self.x, obj_self.y, obj_teamSpawn_red);
					
			//		//Find the spawn number nearest spawn point
					
			//		break;
					
			//	case TEAM.BLUE:
			//		_inst = instance_nearest(obj_self.x, obj_self.y, obj_teamSpawn_blue);	
			//		break;
			//}
			
		
		break;
		
	}
	
}