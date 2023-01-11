/// @description Try to start the game

//Players need to receive the config before acutally starting the game.

//If player has not received the config, do not try to load the map.


//Check to see if we have received all data needed to start game
var _configReady = obj_gameEvents.findEvent(G_EVENT.GAME_CONFIG, 10);
if(_configReady){
		alarmCounterFlag = 0;
		//Handle received data
			var _gameStatus = data.gameStatus;
			var _spawnNum = data.spawnNum;
			
		//Load map
		obj_mapManager.loadMap(config.map);
		
		
			var _teamSpawn;
			var _teamSpawnInst;
			var _spawnInst;
			var _inst;
			
			//Determine team spawn point
			switch(obj_self.playerData.team) {
				case TEAM.RED:
					_teamSpawn = obj_teamSpawn_red;
					break;
					
				case TEAM.BLUE:
					_teamSpawn = obj_teamSpawn_blue;
					break;
			}			
			
			//Find spawnInst
			_teamSpawnInst = instance_nearest(obj_self.x, obj_self.y, _teamSpawn);
			switch(_spawnNum) {
				case 1:
					_spawnInst = obj_teamSpawn_1;
				break;
				
				case 2:
					_spawnInst = obj_teamSpawn_2;
				break;
				
				case 3:
					_spawnInst = obj_teamSpawn_3;
				break;
				
				case 4:
					_spawnInst = obj_teamSpawn_4;
				break;
				
				default:
					show_message("ERROR: Unknown spawn location!");
					_spawnInst = obj_teamSpawn_1;
				break;
				
			}
}
else {
	if(alarmCounterFlag < (500)) {
		alarm[0] = 1; //Continue running this code until config is received.
		alarmCounterFlag++;
		show_debug_message("alarmCounter flag: : " + string(alarmCounterFlag));
	}
	else {
		show_message("Unable to start round, config not received.");	
	}
}

