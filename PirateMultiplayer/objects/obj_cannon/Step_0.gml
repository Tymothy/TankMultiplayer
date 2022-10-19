/// @description Insert description here
// You can write your code in this editor
if (live_call()) return live_result;

var _len = 20;
var _xl = lengthdir_x(_len, attachedInstance.image_angle - 90);
var _yl = lengthdir_y(_len, attachedInstance.image_angle - 90);

if(attachedInstance != noone) {
	x = attachedInstance.x + _xl;
	y = attachedInstance.y + _yl;
	
	var _xm = window_mouse_get_x();
	var _ym = window_mouse_get_y();
	var _angle = point_direction( x, y, mouse_x, mouse_y);
	image_angle = _angle;
}


