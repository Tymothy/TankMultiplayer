/// @description Init
my_touch = -1;

//Grab coords of first touch
xStart = x;
yStart = y;

//Always grab the grid coords that's touched
gridX = to_grid(x);
gridY = to_grid(y);

dragging = false;
dragTimer = -1;


//if(LOGGING) show_debug_message("Clicked: " + string(xStart) + ", " + string(yStart));
var _qt = false
if(_qt) show_debug_message("Grid coord: " + string(gridX) + ", " + string(gridY));

alarm[0] = 1;
