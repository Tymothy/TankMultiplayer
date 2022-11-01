/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();
property.text = "Not Ready";

conditions = function() {

	return true;	

}

activate_button = function() {
	show_debug_message("Sending ready!");
	net_send_lobby_ready(true);

}

deactivate_button = function() {
	show_debug_message("Sending not ready!");
	net_send_lobby_ready(false);
}