/// @description Draw Self
if (live_call()) return live_result;

//draw_set_text_alignment(TEXT.CENTER_TOP, c_black);
//draw_text(x, y - 85, string(playerData.name) + " Client ID:" +string(playerData.clientID));



draw_sprite_ext(vehData.sprites.hull, 1, x, y, 1, 1, image_angle - 180, image_blend, image_alpha);

