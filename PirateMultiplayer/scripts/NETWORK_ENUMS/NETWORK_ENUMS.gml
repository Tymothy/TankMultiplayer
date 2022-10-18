//Server events (Client to Sever)
enum S_EVENT {
	CREATE_SELF,
	UPDATE_POSITION, //Updates the server with current position
	
}

//Client events (Server to Client)
enum C_EVENT {
	CREATE_SELF,
	CREATE_OTHER,
	DESTROY_OTHER,
	UPDATE_POSITION
}