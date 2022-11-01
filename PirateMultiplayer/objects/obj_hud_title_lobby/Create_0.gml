/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

property.text = "Lobby";
property.width = 4.5;
property.height = 1.5;

property.inactiveSprite = spr_header_transparent;
property.textColor = c_white;
property.font = fon_info_medium;
property.soundOnClick = snd_none;
property.soundOffClick = snd_none;
property.soundActivate = snd_none;
create_update();

activate_button = function() {
	//room_goto(rm_mainMenu);
}