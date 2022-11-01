/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

property.text = "Not Connected\nTo Server";
property.width = 2.5;
property.height = 1;

property.inactiveSprite = spr_table02;
property.textColor = c_red;
property.soundOnClick = snd_none;
property.soundOffClick = snd_none;
property.soundActivate = snd_none;
create_update();

activate_button = function() {
	//room_goto(rm_mainMenu);
}