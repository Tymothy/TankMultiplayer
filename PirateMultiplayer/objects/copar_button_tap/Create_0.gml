/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();
text = "Tap";


interact = function() {
	show_debug_message("Tap interact message.");
	if(enabled && clicked) {
		audioMan_play_sfx(property.soundActivate);
		activate_button();	
	}
	//if(
}

activate_button = function() {
	show_debug_message("Tap activate_button message.");
	//Overwrite this in below buttons to do something
	//drawColor = c_red;
	
}

on_click_button = function() {
	show_debug_message("Tap on_click_button message.");
	audioMan_play_sfx(property.soundOnClick);
	//co_audioManager.playSound(property.soundOnClick, VOL_TYPE.SFX, VOL_PRIORITY.HIGH);
	drawColor = property.onClickColor;
	clicked = true;
}

unclick_button = function() {
	show_debug_message("Unclicked.");
	//Audio should play "off click" if activate does not work
	//audioMan_play_sfx(property.soundOffClick);
	clicked = false;	
	drawColor = property.defaultColor;
}