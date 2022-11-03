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
	if(string_count("arena", string(_key)) > 0) {
		//Checked key is a spawn room
		array_insert(arenas, 0, _key);
	}
	
	//if(string_count("normal", string(_key)) > 0) {
	//	//Checked key is a normal room
	//	array_insert(normalRooms, 0, _key);
	//}
	
	//if(string_count("empty", string(_key)) > 0) {
	//	//Checked key is a normal room
	//	array_insert(emptyRooms, 0, _key);
	//}
	_key = ds_map_find_next(packedRoomsJSON, _key);
}

//Match the keys in arenas up with the enums so the server is synced


//room_pack_load_map(packedRoomsJSON[? mapKeys.MAP_0]);
//show_message(_jsonFile);

// and when you're done:

loadMap = function (_map) {
	//Function receives the name of a map, found in the constructor create_map_keys
	
	//Can be improved by making each map it's own struct, which would require
	//One more level down of gathering structs
	var _mapToLoad = variable_struct_get(mapKeys, _map);
	if(_mapToLoad == undefined) show_message("Trying to load a map that does not exist!");
	room_pack_load_map(packedRoomsJSON[? _mapToLoad]);
	
	
}

