/*
function <NAME>(_var1, _var2, _var3...) {
/// @desc ...
/// @arg ....
/// @arg ....
//CODE
}
*/
function connect_to_server() {
	var _ret= network_create_socket(network_socket_ws);
	network_connect_raw_async(_ret, SERVER_IP, SERVER_PORT);
	return _ret;
}

function create_event(_string) constructor{
	eventName = _string;
}

function create_player(_name) constructor {
	event = S_EVENT.CREATE_PLAYER;
	name = _name;
	//x = _x;
	//y = _y;
}

function create_packet(_data) constructor {
	//event = _event;
	data = _data;

}

function server_send(data) {
	var _packet = new create_packet(data);
	var _packet = json_stringify(_packet);
	
	var _buffer = buffer_create(1, buffer_grow, 1);
	
	buffer_write(_buffer, buffer_text, _packet);
	
	network_send_raw(obj_networkManager.clientSocket, _buffer, buffer_tell(_buffer));
	buffer_delete(_buffer);
}


function server_create_player() {
	//var _event = new create_event(S_EVENT.CREATE_PLAYER);
	var _data = new create_player("Lucidi");
	server_send(_data);
}
