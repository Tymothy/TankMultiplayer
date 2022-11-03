#region Adding an event flow
/*
//Add function in client to send data to server
//Add event to S_EVENT in client so client can send to server
//Add event to S_EVENT in server to allow server to listen to client
//Add event to C_EVENT in server so server can send to client
//Add event to C_EVENT in client to allow client to listen to client
//Handle incoming data with obj_networkManager
*/
#endregion

#region Enums
//Server events (Client to Sever)
enum S_EVENT {
	CREATE_SELF =		0,
	UPDATE_POSITION	=	1, //Updates the server with current position
	WEAPON_FIRE =		2,
	DAMAGE_SELF =		3,
	
	
	//Game Logic
	SETUP_ROUND =		100,
	START_ROUND =		101,
	END_ROUND =			102,
	
	
	//ADMIN
	READY =				200,
}

//Client events (Server to Client)
enum C_EVENT {
	CREATE_SELF =		0,
	CREATE_OTHER =		1,
	DESTROY_OTHER =		2,
	UPDATE_POSITION =	3,
	WEAPON_FIRE =		4,
	DAMAGE =			5,
	
	
	//ADMIN
	READY =				200,
	GOTO_MAP =		    201,	
	GAME_CONFIG =		202,
}										

enum GAME_STATUS {
	IDLE =				0,
	IN_LOBBY =			1,
	STARTING =			2,
	PLAYING =			3,
	ENDING =			4,
}

#endregion

#region functions called by game
function net_server_connect() {
	var _ret= network_create_socket(SOCKET);
	var _connection = network_connect_raw_async(_ret,SERVER_IP, SERVER_PORT);
	show_debug_message("_connection" + string(_connection));
	return _ret;
}

function net_send_create_player(_name = "Guest") {
	var _data = new net_create_self(_name);
	net_server_send(_data);
}

function net_send_update_position() {
	var _data = new net_update_position();
	net_server_send(_data);
}

function net_send_weapon_fire() {
	var _data = new net_weapon_fire();
	net_server_send(_data);
}

function net_send_damage_self(_attacker, _type, _damage) {
	var _data = new net_damage_self(_attacker, _type, _damage);
	net_server_send(_data);	
}

function net_send_lobby_ready(_value) {
	var _data = new net_lobby_ready(_value);
	net_server_send(_data);
	
}

#endregion


#region Event constructors
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
	vx = other.vehData.physics.velocity.vx;
	vy = other.vehData.physics.velocity.vy;
	mx = other.playerData.mx;
	my = other.playerData.my;
}

function net_weapon_fire() constructor {
	event = S_EVENT.WEAPON_FIRE;
	
	clientID = other.playerData.clientID;
	x = other.x;
	y = other.y;
	vx = other.vehData.physics.velocity.vx;
	vy = other.vehData.physics.velocity.vy;	
	mx = other.playerData.mx;
	my = other.playerData.my;
}

function net_damage_self(_attacker, _type, _damage) constructor {
	event = S_EVENT.DAMAGE_SELF;
	
	hurtID = other.playerData.clientID;
	attackerID = _attacker;
	type = _type;
	damage = _damage;
	
}

function net_lobby_ready(_value) constructor {
	event = S_EVENT.READY;
	clientID = obj_self.playerData.clientID;
	ready = _value;
}

#endregion

#region Information about network
function net_get_status() {
	//Returns true if connected to server
	//False if not connected
	
	if(instance_exists(obj_networkManager)) {
		return obj_networkManager.connectionStatus;	
	}
	show_debug_message("ERROR: NETWORK MANAGER NOT PRESENT");
	return false;
}


#endregion


#region Helper functions
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

function net_handle_data(_asyncLoad) {
	var _buffer_raw = async_load[? "buffer"];
	var _buffer_processed = buffer_read(_buffer_raw, buffer_text);
	var _data = json_parse(_buffer_processed);
	//_data = variable_struct_get_names(_data.data);
	
	return(_data);
}

#endregion