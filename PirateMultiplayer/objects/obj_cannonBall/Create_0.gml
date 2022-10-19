/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

property.inst = instance_place(x, y, obj_player);
property.spd = 5;
property.dir = -1;
property.type = BALL.NORMAL
property.damage = 1;
property.team = property.inst.playerData.team;

damageApplied = false; //Set to true when damage is applied to prevent duplicate damage

alarm [0] = 500; //Destroy after 500 frames

hit = function() {
	instance_destroy();	
}