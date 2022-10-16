///Zoom window
if(curWindowWidth != (os_browser == browser_not_a_browser ? WIN_W : browser_width) || 
   curWindowHeight != os_browser == browser_not_a_browser ? WIN_H : browser_height)
  updateViewSize();
  
  var _ww = os_browser == browser_not_a_browser ? WIN_W : browser_width;
  var _wh = os_browser == browser_not_a_browser ? WIN_H : browser_height; 
  
  zoomLevel += (mouse_wheel_up() - mouse_wheel_down()) * .1;
  zoomLevel = clamp(zoomLevel, .7, 2);
  
  camera_set_view_size(VIEW, (_ww / 2)* zoomLevel, (_wh / 2) * zoomLevel);
  
  


view_w_half = camera_get_view_width(VIEW)*0.5;
view_h_half = camera_get_view_height(VIEW)*0.5;
xTo = xstart;
yTo = ystart;


if (instance_exists(obj_player))
{
	
	xTo = obj_player.x;
	yTo = obj_player.y;
	xOld = obj_player.x
	yOld = obj_player.y;

}
else
{
	xTo = xOld;
	yTo = yOld;
	
}
//update object position with smooooooothness
var q = 3
if(!instance_exists(obj_player)) q = 25;
x += (xTo-x)/q;
y += (yTo-y)/q

//clamps
x = clamp(x,view_w_half,room_width-view_w_half);
y = clamp(y,view_h_half,room_height-view_h_half);

//setting the camera to this objects x and y
camera_set_view_pos(VIEW,x-view_w_half,y-view_h_half);