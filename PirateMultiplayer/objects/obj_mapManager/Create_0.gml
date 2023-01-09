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
	
	
}

