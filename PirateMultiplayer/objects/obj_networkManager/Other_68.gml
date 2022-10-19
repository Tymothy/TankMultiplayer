/// @description Insert description here
// You can write your code in this editor
var _type = async_load[? "type"];
switch(_type) {
	case network_type_non_blocking_connect:
		show_debug_message("Connected to server");
		
		
	break;
	
	case network_type_disconnect:
		show_debug_message("Disconnected to server");
		
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
					playerData.hp = _data.hp;
					playerData.name = _data.name;
					playerData.team = _data.team;
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
						instance_destroy();
					}
				}
				event_notify(G_EVENT.DESTROY_OTHER);
				break;
			#endregion
			#region UPDATE_POSITION
			case C_EVENT.UPDATE_POSITION:
				var _clientID = _data.clientID;				
				with(obj_other) {
					if(playerData.clientID == _clientID) {
						playerData.xTo = _data.x;
						playerData.yTo = _data.y;
						playerData.aTo = _data.a;
						playerData.mx = _data.mx;
						playerData.my = _data.my;
						
						playerData.framesSinceLastUpdate = 0;						
						//y = lerp(y, _data.y, .2)wad;
					}
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
				with(obj_self) {
					if(playerData.clientID == _hurtID) {
						playerData.hp -= _data.damage;
					}
				event_notify(G_EVENT.DAMAGE);					
				}					
				break;			
			#endregion
			default:
				show_message("Recevied data with an unknown event");
			break;
			
		}
	break;
	
}
