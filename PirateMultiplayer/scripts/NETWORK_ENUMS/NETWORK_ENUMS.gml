//Server events (Client to Sever)
enum S_EVENT {
	CREATE_PLAYER,
	POSITION_UPDATE, //Updates the server with current position
	
}

//Client events (Server to Client)
enum C_EVENT {
	CREATE_PLAYER,
	CREATE_ENEMY,
}