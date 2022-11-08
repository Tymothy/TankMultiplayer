/// @description Insert description here
// You can write your code in this editor
var _type = async_load[? "type"];
switch(_type) {
	case network_type_non_blocking_connect:
		show_debug_message("Connected to server");
		connectionStatus = true;
		
	break;
	
	case network_type_disconnect:
		show_debug_message("Disconnected from server");
		connectionStatus = false;
	break;
	
	case network_type_data:
		var _data = net_handle_data(async_load);
		
		switch(_data.event) {
			#region CREATE_SELF
			case C_EVENT.CREATE_SELF:
				//Create player in game world
				var inst = instance_create_layer(_data.x, _data.y, "lay_players", obj_self);
				with (inst){
					playerData.clientID = _data.clientID;
					playerData.gameStatus = _data.gameStatus;
					playerData.ready = _data.ready;
					playerData.lobby = _data.lobby;
					playerData.team = _data.team;
					playerData.hp = _data.hp;
					playerData.name = _data.name;
					
				}
				event_notify(G_EVENT.CREATE_SELF);
				show_debug_message("Creating player in game world");
			break;
			#endregion
		
			#region CREATE_OTHER
			case C_EVENT.CREATE_OTHER:
				with(instance_create_layer(_data.x, _data.y, "lay_players", obj_other)){
					playerData.clientID = _data.clientID;
					playerData.hp = _data.hp;
					playerData.name = _data.name;
					playerData.team = _data.team;
				}								
				event_notify(G_EVENT.CREATE_OTHER);
				break;
			#endregion
			#region DESTROY_OTHER
			case C_EVENT.DESTROY_OTHER:
						//show_message("Destroy other event");		
						var _destroyID = _data.clientID;
						//show_message("Destroying client with ID" + string(_destroyID));
				with(obj_other) {
					if(playerData.clientID == _destroyID) {
						//show_message("Destroyed client with client ID " + string(playerData.clientID));
						destroy_self();
					}
				}
				event_notify(G_EVENT.DESTROY_OTHER);
				break;
			#endregion
			#region UPDATE_POSITION
			case C_EVENT.UPDATE_POSITION:
				var _clientID = _data.clientID;				
				with(obj_other) {					
						//If the packet received was older that one we already got
						//Discard it					
						//if(playerData.clientID == _clientID){
								if(aliveFrames > 2) updatePos(_data);
								//y = lerp(y, _data.y, .2)wad;
							//}

				}					
				break;
			#endregion
			#region WEAPON_FIRE
			case C_EVENT.WEAPON_FIRE:
				var _clientID = _data.clientID;				
				with(obj_player) {
					if(playerData.clientID == _clientID) {
						playerData.xTo = _data.x;
						playerData.yTo = _data.y;
						playerData.mx = _data.mx;
						playerData.my = _data.my;
						vehData.physics.velocity.vx = _data.vx;
						vehData.physics.velocity.vy = _data.vy;						
						fire = true;
						//y = lerp(y, _data.y, .2)wad;
					}
				event_notify(G_EVENT.WEAPON_FIRE);					
				}					
				break;
			#endregion WEAPON_FIRE
			#region DAMAGE
			case C_EVENT.DAMAGE:
				var _hurtID = _data.hurtID;				
				with(obj_player) {
					if(playerData.clientID == _hurtID) {
						playerData.hp = _data.hurtHP;
					}
				
				}		
				event_notify(G_EVENT.DAMAGE);	
				break;			
			#endregion
			#region GAME_CONFIG
				case C_EVENT.GAME_CONFIG:
					//Give the data straight to the game manager
					obj_gameManager.setGameConfig(_data);	
					
					
					event_notify(G_EVENT.GAME_CONFIG);
				break;
			#endregion
			#region UPDATE_PLAYER
				case C_EVENT.UPDATE_PLAYER:
					//Received an update for player data
					//We don't know what we will receive, so just give the packet to obj_player to figure out
					with(obj_player) {
						receivePlayerData(_data);
					}
					event_notify(G_EVENT.UPDATE_PLAYER);
				break;
			#endregion
			#region GAME_STATUS
				case C_EVENT.GAME_STATUS:
					//Give the data straight to the game manager
					obj_gameManager.handleGameStatus(_data);	
					
					
					event_notify(G_EVENT.GAME_STATUS);		
				break;
			#endregion

			default:
				show_message("Recevied data with an unknown event");
			break;
			
		}
	break;
	
}
