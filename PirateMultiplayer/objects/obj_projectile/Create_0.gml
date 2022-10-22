/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

property.inst = instance_nearest(x, y, obj_player);
property.physics = new add_physics();
property.type = BALL.NORMAL
property.damage = property.inst.vehData.weapon.damage;
property.team = property.inst.playerData.team;
property.angle = 0;
property.sprite = {
	shell : spr_projectile,
	type : 1,
}

//Match x/y speed of player
property.physics.xSpeed = property.inst.vehData.physics.xSpeed;
property.physics.ySpeed = property.inst.vehData.physics.ySpeed;

//Add projectile speed
property.physics.xSpeed += lengthdir_x(property.inst.vehData.weapon.spd, property.inst.vehData.physics.dir);
property.physics.ySpeed += lengthdir_y(property.inst.vehData.weapon.spd, property.inst.vehData.physics.dir);

damageApplied = false; //Set to true when damage is applied to prevent duplicate damage

alarm [0] = 500; //Destroy after 500 frames

hit = function() {
	instance_destroy();	
}