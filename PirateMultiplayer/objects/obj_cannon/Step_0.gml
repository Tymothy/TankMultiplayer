/// @description Insert description here
// You can write your code in this editor
if (live_call()) return live_result;



if(attachedInstance != noone) {
	var _len = 20;
	var _xl = lengthdir_x(_len, attachedInstance.image_angle - 90);
	var _yl = lengthdir_y(_len, attachedInstance.image_angle - 90);

	x = attachedInstance.x + _xl;
	y = attachedInstance.y + _yl;

	var _mx = attachedInstance.playerData.mx;
	var _my = attachedInstance.playerData.my;		
	
	var _angle = point_direction(x, y, _mx, _my);
	image_angle = _angle;
}


