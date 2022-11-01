/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

if(instance_exists(obj_self)) {
	var _ready = obj_self.playerData.ready;	
	
	if(_ready == true) {
		property.text = "Ready";
	}
	else {
		property.text = "Not Ready";	
	}
	
}