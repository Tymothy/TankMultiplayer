enum TEAM{
	RED = 0,
	BLUE = 1,
	
}

enum HULL {
	A,
	B,
	C,
	D,
	E,
	F,
	G,
	H		
}

enum GUN {
	A,
	B,
	C,
	D,
	E,
	F,
	G,
	H		
}


enum VEHICLE {
	SMALL,
	LARGE
}

enum DIR {
	FORWARD, //Front of vehicle
	STARBOARD, //Right of vehicle
	STERN, //Back of vehicle
	PORT //Left of vehicle
}


function create_map_keys() constructor {
	//Associate map names with the packed rooms names
	//First value should match the name of the map
	//Second value should match the associated room in the packed rooms folder.
	
	//Can be improved by making each map it's own struct, which would require
	//One more level down of gathering structs
	
	//meadow = "rm_pack_arena_01";
	
	//This could be put into a JSON file in the future
	
	

	map_01 = {
		roomName :		"rm_pack_arena_01",
		maxPlayers :	"4",
		size :			"small",
		//availableGameModes = {
		//	MODES.CTF,
		//	MODES.PVP,
		//};
		
		
	}
	
	
	
}

//Types of cannon balls
enum BALL {
	NORMAL,	
	
}