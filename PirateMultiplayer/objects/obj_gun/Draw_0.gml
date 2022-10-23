/// @description Insert description here
// You can write your code in this editor
if (live_call()) return live_result;

	var _len = 0;
	var _xl = lengthdir_x(_len, lerp(image_angle -90, property.inst.image_angle - 90, .5));
	var _yl = lengthdir_y(_len, lerp(image_angle -90, property.inst.image_angle - 90, .5));
draw_sprite_ext(property.inst.vehData.sprites.gun, 1, x + _xl, y + _yl, 1, 1, image_angle - 90, image_blend, image_alpha);


