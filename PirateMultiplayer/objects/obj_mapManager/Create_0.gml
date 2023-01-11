/// @description Load available maps
mapKeys = new create_map_keys();
var _file = file_text_open_read(PACKED_ROOMS_PATH);


//var _jsonFile = file_text_read_string(_file);
var i= 0;
var _jsonFile = "";
while (!file_text_eof(_file))
{
   var _str = file_text_readln(_file);
   _jsonFile = _jsonFile + _str;
}
//show_message(string(_jsonFile));
file_text_close(_file);
//json_parse()
//_jsonFile = json_parse(_jsonFile);

//Fill arrays with the keys of each type of room
packedRoomsJSON = json_decode(_jsonFile);
var _size = ds_map_size(packedRoomsJSON);
var _key = ds_map_find_first(packedRoomsJSON);

arenas = array_create(1, 0);

for(var i = 0; i < _size; i++){
	//Iterate through map, add keys to respective arrays
	
	/*
	//Not used at the moment
	if(string_count("arena", string(_key)) > 0) {
		//Checked key is a spawn room
		array_insert(arenas, 0, _key);
	}
	*/
	_key = ds_map_find_next(packedRoomsJSON, _key);
}

loadMap = function (_map) {
	//Function receives the name of a map, found in the constructor create_map_keys

	var _mapToLoad = mapKeys[$ _map][$ "roomName"];
	//if(LOGGING) show_debug_message("Value of mapToLoad: " + string(_mapToLoad));
	if(_mapToLoad == undefined) show_message("Trying to load a map that does not exist!");
	//if(LOGGING) show_debug_message("Value of packedRoomsJSON: " + json_encode(packedRoomsJSON));
	room_pack_load_map(packedRoomsJSON[? _mapToLoad]);
	order_layer_depth(lay_depth);
	
}

//Create layer struct for use for layer depths
lay_depth = {
	lay_markers :		-1000,
	lay_controllers :	-900,
	
	//gui
	lay_gui_top :		-800,
	lay_gui_middle :	-700,
	lay_gui_back :		-600,
	
	//playarea
	lay_playerinfo :	-500,
	lay_targets :		-400,
	lay_gun :			-300,
	lay_projectiles :	-200,
	lay_players :		0,
	
	//map
	lay_map_prop_02 :	200,
	lay_map_prop_01 :	300,
	lay_walls :			400,
	lay_props :			500,
	lay_building_2 :	600,
	lay_building_1 :	700,
	lay_collision_half: 800,
	lay_collision_full: 900,
	lay_ground :		1000,
	
	//bg
	lay_bg_top :		1100,
	lay_bg_mid :		1200,
	lay_bg_back :		1300,
	lay_bg_error :		1400,
}
