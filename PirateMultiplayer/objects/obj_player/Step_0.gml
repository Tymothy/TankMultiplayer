/// @description Insert description here
// You can write your code in this editor

if(event_watch(G_EVENT.CREATE_SELF) || event_watch(G_EVENT.CREATE_OTHER)) {
	//Wait for player to be created to create the ship
	shipData = new create_ship(playerData.ship, playerData.team);
	var _inst = instance_create_layer(x, y, "instances", obj_cannon);
	with (_inst) {
		property.inst = other;
	}
}

var _inst = instance_place(x, y, obj_cannonBall);
if( _inst != noone) {
		//Determine if instance is created by cannonball
		//if(_inst.property.team != playerData.team) {
		//	playerData.hp--;	
			
		//}
		
		
		//Allow friendly fire
		if(_inst.property.inst != id) {
			damageSelf(_inst.property.inst.playerData.clientID, 
				_inst.property.type,  
				_inst.property.damage);
		}		
}