/*
function <NAME>(_var1, _var2, _var3...) {
/// @desc ...
/// @arg ....
/// @arg ....
//CODE
}
*/
function set_touch_grid(_my_touch, _id, _x, _y, _dragging){
		/*
		Columns are each individual touch instance
		Rows track the data of each instance
		ds_grid_set(touchGrid, col, my_touch, val);

		row
		0 = my_touch
		1 = ID of the instance
		2 = x
		3 = y
		4 = guiX
		5 = guiY
		6 = 
		*/
	
	ds_grid_set(co_touchMaster.touchGrid, _my_touch, 0, _my_touch);
	ds_grid_set(co_touchMaster.touchGrid, _my_touch, 1, _id);
	ds_grid_set(co_touchMaster.touchGrid, _my_touch, 2, _x);
	ds_grid_set(co_touchMaster.touchGrid, _my_touch, 3, _y);
	ds_grid_set(co_touchMaster.touchGrid, _my_touch, 4, device_mouse_x_to_gui(_my_touch));
	ds_grid_set(co_touchMaster.touchGrid, _my_touch, 5, device_mouse_y_to_gui(_my_touch));
	ds_grid_set(co_touchMaster.touchGrid, _my_touch, 6, _dragging);

}

function remove_from_touch_grid(_my_touch){
	//Clear the touch instance from grid by setting to all -1 in the col	
	ds_grid_set_region(co_touchMaster.touchGrid, _my_touch, 0, _my_touch, 7, -1);

}

function get_current_touch() {
			var _max = ds_grid_get_max(co_touchMaster.touchGrid, 0, 0, 0, 11);
			if(_max >= 0) {
			//Screen is being touched, find the lowest value to work with first path
				for(var i = 0; i < 11; i++)
				{
					//Find the lowest remaining touch and set that to the current_touch variable
					if(ds_grid_value_exists(co_touchMaster.touchGrid, 0, 0, 0, 11, i) == true) {
						return i;
					}
										
				}
			}
			else {
				return -1;	
			}
}

function get_touch_x(){
	var _ret = co_touchMaster.touchX;
	return _ret;
}

function get_touch_y(){
	var _ret = co_touchMaster.touchY;
	return _ret;
}

function get_touch_gui_x() {
	var _ret = co_touchMaster.touchGuiX;
	return _ret;	
}

function get_touch_gui_y(){
	var _ret = co_touchMaster.touchGuiY;
	return _ret;
}

function get_touch_gridX(_my_touch){
	var _ret = to_grid(get_touch_x());
	return _ret;
}

function get_touch_gridY(_my_touch){
	var _ret = to_grid(get_touch_y());
	return _ret;
}

function get_touch_release_x() {
	var _ret = co_touchMaster.releaseX;
	return _ret;
}

function get_touch_release_y() {
	var _ret = co_touchMaster.releaseY;
	return _ret;
}

function get_touch_release_gui_x() {
	var _ret = co_touchMaster.releaseGuiX;
	return _ret;
}

function get_touch_release_gui_y() {
	var _ret = co_touchMaster.releaseGuiY;
	return _ret;
}

function get_touch_drag(_my_touch) {
	var _ret = ds_grid_get(co_touchMaster.touchGrid, _my_touch, 6);	
	return _ret;
}

function get_touch_intent(_my_touch) {
	var _ret = ds_grid_get(co_touchMaster.touchGrid, _my_touch, 7);	
	return _ret;	
}

function get_touch_state_on_change() {
	if(instance_exists(co_touchMaster))
	{
		var _tc = co_touchMaster.touchChange;
		var _ts = co_touchMaster.TOUCH_STATE;
		if(_tc == true) {
			return _ts;
		}
		else {
			return -1;	
		}
	}
}

function get_gridY() {
	if(instance_exists(co_touchMaster)) {
		var _ret = co_touchMaster.gridY;
		if(_ret == -1) _ret = co_touchMaster.oldGridY; //Touch was released so we need the old gridY
	}
	else {
		var _ret = -1;	
	}
	return _ret;
}

function get_gridX() {
	if(instance_exists(co_touchMaster)) {
		var _ret = co_touchMaster.gridX;
		if(_ret == -1) _ret = co_touchMaster.oldGridX; //Touch was released so we need the old gridX.
	}
	else {
		var _ret = -1;	
	}
	return _ret;
}

function get_drag(){
	if(instance_exists(co_touchMaster)) {
	var _ret = co_touchMaster.dragging;
	return _ret;
	}
}
