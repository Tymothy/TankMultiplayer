/// @description Insert description here
// You can write your code in this editor


cam = view_camera[0];
view_w_half = camera_get_view_width(cam)*0.5;
view_h_half = camera_get_view_height(cam)*0.5;

scrollDist = 0
scrollRate = 3;
//xSize = camera_get_view_width(cam);
//ySize = camera_get_view_width(cam);

xTo = 0;
yTo = 0;
xOld = 0;
yOld = 0;
//xTo = xstart;
//yTo = ystart;

//view_set_hport(0, 1080 + scrollDist);
//view_set_wport(0, 1920 + scrollDist);

zoom_level = 1;

//Get the starting view size to be used for interpolation later
default_zoom_width = camera_get_view_width(view_camera[0]);
default_zoom_height = camera_get_view_height(view_camera[0]);