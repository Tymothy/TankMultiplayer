/// @func draw_set_text_alignment(alignment<enum>,color<optional>)
/// @param Text_Enum
/// @param <Color>
function draw_set_text_alignment() {
	enum TEXT
	{
		LEFT_BOTTOM = 1,
		CENTER_BOTTOM = 2,
		RIGHT_BOTTOM = 3,
		LEFT_MIDDLE = 4,
		CENTER_MIDDLE = 5,
		RIGHT_MIDDLE = 6,
		LEFT_TOP = 7,
		CENTER_TOP = 8,
		RIGHT_TOP = 9,
	}
	//Why the above values?  Look at your numpad.

	switch(argument[0])
	{
	    case 1: draw_set_halign(fa_left);   draw_set_valign(fa_bottom); break;
	    case 2: draw_set_halign(fa_center); draw_set_valign(fa_bottom); break;
	    case 3: draw_set_halign(fa_right);  draw_set_valign(fa_bottom); break;
	    case 4: draw_set_halign(fa_left);   draw_set_valign(fa_middle); break;
	    case 5: draw_set_halign(fa_center); draw_set_valign(fa_middle); break;
	    case 6: draw_set_halign(fa_right);  draw_set_valign(fa_middle); break;
	    case 7: draw_set_halign(fa_left);   draw_set_valign(fa_top); break;
	    case 8: draw_set_halign(fa_center); draw_set_valign(fa_top); break;
	    case 9: draw_set_halign(fa_right);  draw_set_valign(fa_top); break;
	}

	if (argument_count==2)
	    draw_set_color(argument[1]);



}
