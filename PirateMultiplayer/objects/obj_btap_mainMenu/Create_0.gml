/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

property.text = "Main Menu";
property.anchor = ANCHOR.BOTTOM_LEFT;
property.x = 0;
property.y = -1;
property.width = 2;
property.height = 1;
property.defaultColor = c_orange;
property.onClickColor = c_red;


create_update();

activate_button = function() {
	room_goto(rm_mainMenu);
}