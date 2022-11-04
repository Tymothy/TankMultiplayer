/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

property.text = "Set Username";
property.width = 2.75;
property.height = 1;
property.textColor = c_white;

inputObject = noone;
create_update();

activate_button = function() {
	if(inputObject = noone) {
		inputObject = instance_create_depth(x,y, 1, obj_input);
		//TODO: This button system is so bad to set username
		obj_hud_screen_username.active = true;
	}
	else {
		//property.text = inputObject.setString();
		instance_destroy(inputObject);
		inputObject = noone;	
		
	}
	
}