/// @description Watches for things to happen in game then takes actions


config = {
	map : "",	
	
}

setGameConfig = function(_data) {
	//Set configs, but don't apply yet
	config.map = _data.map;
	
	applyGameConfig();
}


applyGameConfig = function() {
		obj_mapManager.loadMap(config.map);
}