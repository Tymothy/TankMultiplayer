/*
function <NAME>(_var1, _var2, _var3...) {
/// @desc ...
/// @arg ....
/// @arg ....
//CODE
}
*/
function create_event(_string) constructor{
	eventName = _string;
}

function create_player(_name, _x, _y) constructor {
	name = _name;
	x = _x;
	y = _y;
}

function create_packet(_event, _data) constructor {
	eventName = _event;
	data = _data;
}

function server_send(event, data) {
	var _packet = new create_packet(event, data);
	var _packet = json_stringify(_packet);
	
	var _buffer = buffer_create(1, buffer_grow, 1);
	
	buffer_write(_buffer, buffer_text, _packet);
	
	network_send_raw(clientSocket, _buffer, buffer_tell(_buffer));
	buffer_delete(_buffer);
}


function server_create_player() {
	var _event = new create_event("create_player");
	var _data = new create_player("Tester", oPlayer.x, oPlayer.y);
		
	server_send(_event, _data);
}
