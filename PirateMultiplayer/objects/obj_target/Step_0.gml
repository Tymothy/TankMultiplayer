/// @description Insert description here
// You can write your code in this editor

//Damage collision for projectile
var _inst = instance_place(x, y, obj_projectile);
if( _inst != noone) {	
		//Allow friendly fire
		if(_inst.property.inst != id) {
			
			_inst.damageApplied = true;
			_inst.hit();
		}	
		hit();		
		//resetCooldown();

		
}
//cooldown--;

