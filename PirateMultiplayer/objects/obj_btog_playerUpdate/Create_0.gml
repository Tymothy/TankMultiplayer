/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();
property.text = "Player Update";

conditions = function() {

	return true;	

}

activate_button = function() {
	//show_debug_message("Sending ready!");
	var _obj = {
		ready : true,	
	}
	net_send_update_player(_obj);

}

deactivate_button = function() {
	//show_debug_message("Sending not ready!");
	var _obj = {
		ready : false,	
	}
	net_send_update_player(_obj);

}