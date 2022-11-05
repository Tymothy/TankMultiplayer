enum G_EVENT {
	CREATE_SELF,
	CREATE_OTHER,
	DESTROY_OTHER,
	WEAPON_FIRE,
	DAMAGE,
	
	READY,
	GAME_CONFIG,
	UPDATE_PLAYER,
}

function event_notify(_event) {
	//Adds an event to the came
	obj_gameEvents.addEvent(_event);
}

function event_watch(_event) {
	//Returns true when an event happens
	var _ret = obj_gameEvents.watchEvent(_event);
	return _ret;
}