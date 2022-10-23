/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_other)){
	var _x0 = obj_other.net.x0;
	var _x1 = obj_other.net.x1;
	var _x2 = obj_other.net.x2;

	var _y0 = obj_other.net.y0;
	var _y1 = obj_other.net.y1;
	var _y2 = obj_other.net.y2;

	draw_sprite(spr_debug_point, 0, _x0, _y0 );
	draw_sprite(spr_debug_point, 1, _x1, _y1 );
	draw_sprite(spr_debug_point, 2, _x2, _y2 );
	draw_sprite(spr_debug_point, 3, obj_other.x, obj_other.y);
	
	draw_sprite(spr_debug_point, 3, obj_other.net.mx, obj_other.net.my)
} else {
	instance_destroy();	
}