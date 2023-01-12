/// @description Draw player info
if (live_call()) return live_result;
if(instance_exists(property.inst)) {
	//Draw the name
	var _name = property.inst.playerData.name;
	var _hp = property.inst.playerData.hp;
	var _ready = property.inst.playerData.ready;
	var _team = property.inst.playerData.team;
	var _clientID = property.inst.playerData.clientID;
	
	//Draw a white box to pop the name and health a bit
	var _x1 = -150;
	var _x2 = 150;
	var _y1 = -215;
	var _y2 = -100;
	
	draw_set_alpha(.3);
	draw_set_color(c_white);
	draw_rectangle(x + _x1, y + _y1, x + _x2, y + _y2, false);
	draw_set_alpha(1);
	
	draw_set_text_alignment(TEXT.CENTER_TOP, c_black);
	draw_set_font(fon_info_medium);
	
	//Draw Name
	draw_text(x + property.nameX, y + property.nameY, string(_name));
	
	//Draw HP
	//draw_text(x + property.hpX, y + property.hpY, string(_hp));

	//Draw Ready
	//draw_text(x + property.hpX, y + property.hpY, "Ready: " +string(_ready));
	
	//Draw Team
	draw_text(x + property.hpX, y + property.hpY, "CID: " +string(_clientID));

	if(property.inst.fireCooldown > 0) {
	draw_set_color(c_red);
	draw_set_alpha(.5);
	draw_rectangle(x - property.inst.fireCooldown / 2,
					y - 4,
					x + property.inst.fireCooldown / 2,
					y + 15, false);
	draw_set_color(c_black);
	draw_set_alpha(1);
	}

	//TEMP
	if(_hp <= 0) {
		draw_set_font(fon_info_large);
		draw_set_text_alignment(TEXT.CENTER_MIDDLE, c_red);
		draw_text(x, y, "DEAD");
	}
	
}

