/// @description Insert description here
// You can write your code in this editor

if(event_watch(G_EVENT.CREATE_SELF) || event_watch(G_EVENT.CREATE_OTHER)) {
	//Wait for player to be created to create the ship
	shipData = new create_ship(playerData.ship, playerData.team);
	var _inst = instance_create_layer(x, y, "instances", obj_cannon);
	with (_inst) {
		attachedInstance = other;
	}
}