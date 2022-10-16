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
		var _data = handle_data(async_load);
		
		switch(_data.event) {
			case C_EVENT.CREATE_PLAYER:
				//Create player in game world
				with(instance_create_layer(_data.x, _data.y, "lay_players", obj_player)){
					playerData.clientID = _data.clientID;
					playerData.health = _data.health;
					playerData.name = _data.name;
					playerData.team = _data.team;
					
				}
				show_message("Creating player in game world");
			break;
			
			default:
				show_message("Recevied data with an unknown event");
			break;
			
		}
	break;
	
}
