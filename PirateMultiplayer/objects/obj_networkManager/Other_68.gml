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
			
			case C_EVENT.CREATE_OTHER:
				with(instance_create_layer(_data.x, _data.y, "lay_players", obj_other)){
					playerData.clientID = _data.clientID;
					playerData.hp = _data.hp;
					playerData.name = _data.name;
					playerData.team = _data.team;
					
				}								
				event_notify(G_EVENT.CREATE_OTHER);
				break;
				
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
			
			default:
				show_message("Recevied data with an unknown event");
			break;
			
		}
	break;
	
}
