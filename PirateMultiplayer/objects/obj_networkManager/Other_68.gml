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
		
	break;
	
}
