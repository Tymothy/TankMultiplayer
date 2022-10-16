/// @description Insert description here
// You can write your code in this editor

//view_set_hport(0, 1080 + scrollDist);
//view_set_wport(0, 1920 + scrollDist);

//camera_set_view_size(cam, xSize, ySize);

view_w_half = camera_get_view_width(cam)*0.5;
view_h_half = camera_get_view_height(cam)*0.5;
xTo = xstart;
yTo = ystart;
cam = view_camera[0];


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
//x = clamp(x,view_w_half,room_width-view_w_half);
//y = clamp(y,view_h_half,room_height-view_h_half);

//setting the camera to this objects x and y
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);
