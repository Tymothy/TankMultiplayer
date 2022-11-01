/// @description Draw to GUI
update();

/*
OLD DRAW FUNCTIONS THAT DON'T USE SPRITE
//draw_set_color(drawColor);
//draw_rectangle(x1, y1, x2, y2, false);

//Draws the outline of the button
//draw_set_color(c_black);
//draw_rectangle(x1, y1, x2, y2, true);
*/
if(clicked){
	draw_sprite_stretched(property.activeSprite, 0, x1, y1, abs(x1-x2), abs(y1-y2));
}
else { 
	draw_sprite_stretched(property.inactiveSprite, 0, x1, y1, abs(x1-x2), abs(y1-y2));
}
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(property.font);
draw_set_color(property.textColor);
draw_text((x1 + x2) / 2, (y1 + y2) / 2, property.text);

