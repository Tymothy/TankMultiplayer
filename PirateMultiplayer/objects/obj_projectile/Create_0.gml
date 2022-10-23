/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

property.inst = instance_nearest(x, y, obj_player);
property.physics = new add_physics();
property.type = BALL.NORMAL
property.damage = property.inst.vehData.weapon.damage;
property.team = property.inst.playerData.team;
property.bounce = property.inst.vehData.weapon.bounce;
property.angle = 0;
property.sprite = {
	shell : spr_projectile,
	type : 1,
}


damageApplied = false; //Set to true when damage is applied to prevent duplicate damage

alarm [0] = 5000; //Destroy after 500 frames.  It should be destroyed in other methods, but this is a failsafe
apply_physics = function() {
	//Match velocity of tank
	//property.physics.velocity.add(property.inst.vehData.physics.velocity);


	//Add projectile speed
	var _vecX = lengthdir_x(property.inst.vehData.weapon.spd, property.physics.dir);
	var _vecY = lengthdir_y(property.inst.vehData.weapon.spd, property.physics.dir);
	var _gunVec = new vector(_vecX, _vecY);
	property.physics.velocity.add(_gunVec);	
	
	//TODO: Set bullet position to end of barrel
	 
}

hit = function() {
	destroyProjectile();	
}

destroyProjectile = function() {
	//Put some animation or other feedback here
	instance_destroy();
}