/// @description Draw Self
draw_self();
draw_set_text_alignment(TEXT.CENTER_TOP, c_aqua);
draw_text(x, y - 20, string(playerData.name));
draw_text(x, y + 20, string(playerData.hp));