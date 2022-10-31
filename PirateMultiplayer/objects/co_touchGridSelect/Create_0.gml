/// @description Init
my_touch = -1;
indicatorID = 0;
xGridCoord = to_grid(x);
yGridCoord = to_grid(y);

var _qt = false;
if(_qt) show_debug_message("co_touchGridSelect created at grid: " + coords_string(xGridCoord, yGridCoord));
//alarm[0] = 1; //This was used to debug my_touch, no longer needed