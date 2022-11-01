/// @description At start of room, create the layout


switch(room) {
	case rm_mainMenu:
		create_button(obj_btap_lobby, ANCHOR.BOTTOM_RIGHT, -.25, -.25);
	
	break;
	
	case rm_lobby:
		create_button(obj_hud_title_lobby, ANCHOR.TOP_CENTER, 0, .25);
		create_button(obj_btap_mainMenu, ANCHOR.BOTTOM_LEFT, .25, -.25);
		create_button(obj_hud_networkStatus, ANCHOR.TOP_LEFT, .25, .25);
		create_button(obj_btog_ready, ANCHOR.MIDDLE_RIGHT, -.25, 0);
	break;	
}
