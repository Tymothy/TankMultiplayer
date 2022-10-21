/// @description Insert description here
// You can write your code in this editor

if(event_watch(G_EVENT.CREATE_SELF) || event_watch(G_EVENT.CREATE_OTHER)) {
	//Wait for player to be created to create the ship
	vehData = new create_vehicle(playerData.ship, playerData.team);
	var _inst = instance_create_layer(x, y, "instances", obj_cannon);
	
	attachInst(_inst);
	//with (_inst) {
	//	property.inst = other;
	//}
}

//Damage collision for cannon ball
var _inst = instance_place(x, y, obj_cannonBall);
if( _inst != noone) {	
		//Allow friendly fire
		if(_inst.property.inst != id && _inst.damaged != true) {
			
			//If the collision is with self, apply damage
			if(_inst.property.inst.playerData.clientID == obj_self.playerData.clientID) {
				damageSelf(_inst.property.inst.playerData.clientID, 
					_inst.property.type,  
					_inst.property.damage);
			}
			_inst.damageApplied = true;
			_inst.hit();
		}	
		
}
fireCooldown--;
fireCooldown = clamp(fireCooldown, 0, 1000);