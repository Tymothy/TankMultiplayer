/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();
property.text = "Not Ready";

conditions = function() {

	return true;	

}

activate_button = function() {
	var _obj = {
		ready : true,	
	}
	property.text = "Ready";
	net_send_update_player(_obj);

}

deactivate_button = function() {
	var _obj = {
		ready : false,	
	}
	property.text = "Not Ready";
	net_send_update_player(_obj);
}