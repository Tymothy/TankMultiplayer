/// @description Draw Self
if (live_call()) return live_result;
draw_self();
var xScale = 1;
var yScale = 1;

draw_set_text_alignment(TEXT.CENTER_TOP, c_black);
draw_text(x, y - 85, string(playerData.name) + " Client ID:" +string(playerData.clientID));

var _xr = lengthdir_x(1, image_angle - 90);
var _yr = lengthdir_y(1, image_angle - 90);

draw_sprite_ext(shipData.sprites.hull, 3 - playerData.hp, x, y, xScale, yScale, image_angle, image_blend, image_alpha);
draw_sprite_ext(shipData.sprites.sailLarge, 3 - playerData.hp, x, y, xScale, yScale, image_angle, image_blend, image_alpha);
draw_sprite_ext(shipData.sprites.flag, 3 - playerData.hp, x + (_xr * 20), y - (_yr * 20), xScale, yScale, image_angle - 90, image_blend, image_alpha);
//draw_text(x, y + 20, string(playerData.hp));