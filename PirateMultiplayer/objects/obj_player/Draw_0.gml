/// @description Draw Self
if (live_call()) return live_result;
draw_self();
var xScale = 1;
var yScale = 1;

draw_set_text_alignment(TEXT.CENTER_TOP, c_black);
draw_text(x, y - 85, string(playerData.name) + " Client ID:" +string(playerData.clientID));


//sprite_set_offset(shipData.sprites.flag, 40, 0);

////Set offset of flag sprite
//var _xOrg = sprite_get_width(shipData.sprites.flag) / 2;
//var _yOrg = sprite_get_height(shipData.sprites.flag) / 2;
////sprite_set_offset(shipData.sprites.flag, _xOrg + 40, _yOrg - 0);

////Set offset of small sail
//var _xOrg = sprite_get_width(shipData.sprites.sailSmall) / 2;
//var _yOrg = sprite_get_height(shipData.sprites.sailSmall) / 2;

var _pd = point_direction(x, y, x, y + 50);




//Do lenghtdir twice. First to get the new origin, and then again for the offset

draw_sprite_ext(shipData.sprites.hull, 3 - playerData.hp, x, y, xScale, yScale, image_angle, image_blend, image_alpha);

var _len = 7;
var _xl = lengthdir_x(_len, image_angle + 90);
var _yl = lengthdir_y(_len, image_angle + 90);
draw_sprite_ext(shipData.sprites.sailLarge, 3 - playerData.hp, x +_xl, y + _yl, xScale, yScale, image_angle, image_blend, image_alpha);

//Flag
var _len = 40;
var _xl = lengthdir_x(_len, image_angle + 90);
var _yl = lengthdir_y(_len, image_angle + 90);
draw_sprite_ext(shipData.sprites.flag, 3 - playerData.hp, x +_xl, y + _yl, xScale, yScale, image_angle - 90, image_blend, image_alpha);

//Flag
_len = 40;
_xl = lengthdir_x(_len, image_angle - 90);
_yl = lengthdir_y(_len, image_angle - 90);
draw_sprite_ext(shipData.sprites.sailSmall, 3 - playerData.hp, x +_xl, y + _yl, xScale, yScale, image_angle, image_blend, image_alpha);

//Pole
var _xl = lengthdir_x(_len, image_angle - 90);
var _yl = lengthdir_y(_len, image_angle - 90);
draw_sprite_ext(spr_pole, 3 - playerData.hp, x +_xl, y + _yl, xScale, yScale, image_angle, image_blend, image_alpha);