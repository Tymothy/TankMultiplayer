/// @description Send data to server


function LN_send_data(EVENT, DS_MAP) {
	var _buffer = buffer_create(1, buffer_grow, 1);
	var _order = ds_map_create();
	ds_map_add(_order, "eventName", EVENT);
	//Order has 2 things - eventName, and the data we will be sending
	
	//Create a copy of DS Map to send to server
	var _data = ds_map_create();
	ds_map_copy(_data, DS_MAP);
		
	_data[? "id"] = global.clientID;
	_data[? "x"] = oPlayer.x;
	_data[? "y"] = oPlayer.y;
	_data[? "A"] = oPlayer.image_angle;
	
	ds_map_add(_order, "data", json_encode(_data));
	
	buffer_write(_buffer, buffer_text, json_encode(_order));
	network_send_raw(clientSocket, _buffer, buffer_tell(_buffer));
	buffer_delete(_buffer);
	
	//Clean up DS Maps created in this function
	ds_map_destroy(_order);
	ds_map_destroy(_data);
	
}

function LN_send_player_data() {
	var _playerData = ds_map_create();
	_playerData[? "id"] = global.clientID;
	_playerData[? "x"] = oPlayer.x;
	_playerData[? "y"] = oPlayer.y;
	_playerData[? "A"] = oPlayer.image_angle;
	
}

var _buffer = buffer_create(1, buffer_grow, 1);
var _order = ds_map_create();
ds_map_add(_order, "eventName", "position_update");
//Order has 2 things - eventName, and the data we will be sending
	
//The data we are sending
var _data = ds_map_create();
		
_data[? "id"] = global.clientID;
_data[? "x"] = oPlayer.x;
_data[? "y"] = oPlayer.y;
_data[? "A"] = oPlayer.image_angle;
	
ds_map_add(_order, "data", json_encode(_data));
	
buffer_write(_buffer, buffer_text, json_encode(_order));
network_send_raw(clientSocket, _buffer, buffer_tell(_buffer));
buffer_delete(_buffer);
ds_map_destroy(_order);
ds_map_destroy(_data);


