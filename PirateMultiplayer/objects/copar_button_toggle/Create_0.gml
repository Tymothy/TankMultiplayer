/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();
text = "Tap";
active = false; //Tracks whether the button is toggled on or off

interact = function() {
	show_debug_message("Tap interact message.");
	if(enabled) {
		if(active) {
			active = false;
			drawColor = property.defaultColor;
			deactivate_button();	
		}
		else {
			active = true;
			drawColor = property.activeColor;
			activate_button();
		}
	}
}

activate_button = function() {
	show_debug_message("Tap activate_button message.");
	//Overwrite this in below buttons to do something
	//drawColor = c_red;
	
}

deactivate_button = function() {
	show_debug_message("Tap deactivate_button message.");
	//Overwrite this in below buttons to do something
	//drawColor = c_red;		
}

on_click_button = function() {
	show_debug_message("Tap on_click_button message.");
	if(enabled) {
		drawColor = property.onClickColor;
		clicked = true;
	}
}

unclick_button = function() {
	show_debug_message("Unclicked.");
	clicked = false;
	//drawColor = property.defaultColor;
}