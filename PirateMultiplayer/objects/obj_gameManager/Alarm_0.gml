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
		
		
			var _team;
			var _spawnInst;
			var _inst;
			
			/*
			TODO: CHANGE MARKERS TO USE DIRECT SPAWN POINTS ONLY
			EACH SPAWN POINT WILL BE SET TO BLUE OR RED
			
			
			*/
			
			//Determine team spawn point
			_team = get_spawn_team(obj_self);
			switch (_team) {
				case TEAM.RED:
					switch(_spawnNum) {
						case 1:
							_spawnInst = obj_spawn_red_1;
						break;
				
						case 2:
							_spawnInst = obj_spawn_red_2;
						break;
				
						case 3:
							_spawnInst = obj_spawn_red_3;
						break;
				
						case 4:
							_spawnInst = obj_spawn_red_4;
						break;
				
						default:
							show_message("ERROR: Unknown spawn location!");
						break;
					}
					break;
				
				case TEAM.BLUE:
					switch(_spawnNum) {
						case 1:
							_spawnInst = obj_spawn_blue_1;
						break;
				
						case 2:
							_spawnInst = obj_spawn_blue_2;
						break;
				
						case 3:
							_spawnInst = obj_spawn_blue_3;
						break;
				
						case 4:
							_spawnInst = obj_spawn_blue_4;
						break;
				
						default:
							show_message("ERROR: Unknown spawn location!");
						break;
					}
					break;
					default:
						show_message("Team is not a known team!");
					break;
			}
			
			//Tell obj_self to move to spawn point
			set_self_x(_spawnInst.x);
			set_self_y(_spawnInst.y);
			
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

