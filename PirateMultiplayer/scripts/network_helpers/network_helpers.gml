/*
function <NAME>(_var1, _var2, _var3...) {
/// @desc ...
/// @arg ....
/// @arg ....
//CODE
}
*/
function net_server_connect() {
	var _ret= network_create_socket(network_socket_ws);
	network_connect_raw_async(_ret, SERVER_IP, SERVER_PORT);
	return _ret;
}

function net_create_event(_string) constructor{
	eventName = _string;
}

function net_create_self(_name) constructor {
	event = S_EVENT.CREATE_SELF;
	name = _name;
	a = 0;
	
	//x = _x;
	//y = _y;
}

function net_update_position() constructor {
	//Send current position to sever
	event = S_EVENT.UPDATE_POSITION;
	
	clientID = other.playerData.clientID;
	x = other.x;
	y = other.y;
	a = other.image_angle;
	mx = other.playerData.mx;
	my = other.playerData.my;
}

function net_create_packet(_data) constructor {
	//event = _event;
	data = _data;

}

function net_server_send(data) {
	var _packet = new net_create_packet(data);
	var _packet = json_stringify(_packet);
	
	var _buffer = buffer_create(1, buffer_grow, 1);
	
	buffer_write(_buffer, buffer_text, _packet);
	
	network_send_raw(obj_networkManager.clientSocket, _buffer, buffer_tell(_buffer));
	buffer_delete(_buffer);
}


function net_send_create_player() {
	var _data = new net_create_self("Lucidi");
	net_server_send(_data);
}

function net_send_update_position() {
	var _data = new net_update_position();
	net_server_send(_data);
}

function net_handle_data(_asyncLoad) {
	var _buffer_raw = async_load[? "buffer"];
	var _buffer_processed = buffer_read(_buffer_raw, buffer_text);
	var _data = json_parse(_buffer_processed);
	//_data = variable_struct_get_names(_data.data);
	
	return(_data);
	
	
	
}