/// @description Holds all game events that happen

eventArray = [];
addEvent = function(_event) {
	var item ={
		event : _event,
		frame : global.frameCounter,
	}
	array_push(eventArray, item);
	show_debug_message(string(eventArray));
}

watchEvent = function(_event) {
	var _frameToCheck = global.frameCounter -1;
	for(var i = array_length(eventArray) - 1 ; i >= 0; i--) {
	//Go through the array backwards, retrieving most recent events first
	//searches for events that occured on last frame
		if(eventArray[i][$ "event"] == _event && eventArray[i][$ "frame"] >= _frameToCheck) {
			return true;	
		}
		if(eventArray[i][$ "frame"] < _frameToCheck) {
			return false;	
		}
	}
	return false;
}