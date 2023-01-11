/*
function <NAME>(_var1, _var2, _var3...) {

//CODE
}
*/
function order_layer_depth(_layerStruct){
	/// @desc Given a struct containing layer names and depths, set all found layers to that depth
	/// @arg layerStruct
	var _ll = true;
	var str = "";
	if(_ll) show_debug_message("===Local logging for order_layer_depth===");
	
	var array = variable_struct_get_names(_layerStruct);
	if(_ll) show_debug_message("Variables for struct: " + string(array));
	for (var i = 0; i < array_length(array); i++;)
	{
		
		if(layer_exists(array[i])) {
			if(_ll) show_debug_message("Layer Exists");
			if(_ll) show_debug_message("Setting layer " + string(array[i]) +" to " + string(variable_struct_get(_layerStruct, array[i])));
			layer_depth(array[i], variable_struct_get(_layerStruct, array[i]));
		}
		else {
			if(_ll) show_debug_message("Layer does not exist.");	
		}
	    if(_ll) str = array[i] + ":" + string(variable_struct_get(_layerStruct, array[i]));
	    if(_ll) show_debug_message(str);
	}	
	if(_ll) show_debug_message("===End local logging for order_layer_depth===");
	
	
}