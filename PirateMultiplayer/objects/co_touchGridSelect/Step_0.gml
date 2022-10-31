/// @description 
if(instance_exists(indicatorID))
{
	//Check to see if touch moved to another grid square
	var _x = to_grid(indicatorID.x);
	var _y = to_grid(indicatorID.y);
	//Check to see if 
	if(_x != xGridCoord || _y != yGridCoord)
	{
		//Touch moved to another grid square
		xGridCoord = _x;
		yGridCoord = _y;
		var _qt = false;
		if(_qt) show_debug_message("Mouse moved to "+ coords_string(xGridCoord, yGridCoord));
	}
	
}
else
{
	released_at_grid_coords(xGridCoord, yGridCoord);
	//Touch was released
	var _qt = false;
	if(_qt) show_debug_message("Mouse released, destroying co_touchGridSelect at " + coords_string(xGridCoord, yGridCoord));
	instance_destroy();
}