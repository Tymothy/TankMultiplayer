/// @description Draw Self
draw_self();
draw_set_text_alignment(TEXT.CENTER_TOP, c_black);
draw_text(x, y - 30, string(playerData.name) + " Client ID:" +string(playerData.clientID));
draw_text(x, y + 20, string(playerData.hp));