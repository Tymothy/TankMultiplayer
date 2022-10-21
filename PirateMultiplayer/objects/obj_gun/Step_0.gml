/// @description Insert description here
// You can write your code in this editor
if (live_call()) return live_result;

event_inherited();

if(property.inst != noone) {
	var _len = -30;
	var _xl = lengthdir_x(_len, property.inst.image_angle - 90);
	var _yl = lengthdir_y(_len, property.inst.image_angle - 90);

	x = property.inst.x + _xl;
	y = property.inst.y + _yl;

	var _mx = property.inst.playerData.mx;
	var _my = property.inst.playerData.my;		
	
	var _angle = point_direction(x, y, _mx, _my);
	image_angle = _angle;
}

if(property.inst.fire == true) {
	//Fire a projectile
	var _mx = property.inst.playerData.mx;
	var _my = property.inst.playerData.my;	
	var _dir = point_direction(x, y, _mx, _my);
	
	var _inst = instance_create_layer(x, y, "lay_projectiles", obj_projectile);
	with (_inst) {
		property.dir = _dir;
	}
	
	property.inst.fire = false;
	property.inst.fireCooldown = property.inst.vehData.weapon.cooldown;
}