/// @description Update on move, destroy on release

//Update position

x = device_mouse_x(my_touch);
y = device_mouse_y(my_touch);
var guiX = device_mouse_x_to_gui(my_touch);
var guiY = device_mouse_y_to_gui(my_touch);

//Check grid coords, if not the same, set dragging to true
var _gridX = to_grid(x);
var _gridY = to_grid(y);

if(_gridX != gridX || _gridY != gridY)
{
	//Touch is still active, but has been dragged across to another tile.  
	//Set dragging to true and start dragTimer, or reset dragTimer to 0
	dragging = true;
	dragTimer = 0;
}

if(dragTimer >= 0 && dragTimer < DRAG_TIME_MIN)
{
	dragTimer++;	
}
else {
	dragTimer = -1;
	dragging = false;
}


//Destroy on release
if (device_mouse_check_button_released(my_touch, mb_any))
{
	remove_from_touch_grid(my_touch); //Sets the associated grid to -1s
	instance_destroy();
}