/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

property.text = obj_playerData.username;
property.width = 6;
property.height = 3;

property.inactiveSprite = spr_table02;
property.textColor = c_white;
property.font = fon_info_medium;
property.soundOnClick = snd_none;
property.soundOffClick = snd_none;
property.soundActivate = snd_none;
create_update();

active = false;
usernameString = "";

activate_button = function() {
	//room_goto(rm_mainMenu);
}