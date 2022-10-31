/// @description Insert description here
// You can write your code in this editor


update();

/// @description Watch for button touches
touchState = get_touch_state_on_change();
touchX = get_touch_gui_x();
touchY = get_touch_gui_y();
releaseX = get_touch_release_gui_x();
releaseY = get_touch_release_gui_y();
//OLD CODE BELOW, WE WANT TO HAVE TOUCHMASTER CHECK THE COLLISION FIRST
update();
switch(touchState) {
	case T_STATE.IDLE:
	case T_STATE.SAME_TOUCH:
		//Do nothing on idle
		break;
		
	case T_STATE.NEW_TOUCH:
	case T_STATE.DIFFERENT_TOUCH:
		//See if we are touching current button
		if(point_in_rectangle(touchX, touchY, x1, y1, x2, y2)) {
			on_click_button();	
		}
		break;
		
	case T_STATE.RELEASE:
		if(point_in_rectangle(releaseX, releaseY, x1, y1, x2, y2)) {
			interact();
			show_debug_message("Interact with button");
		}
		break;	
}

if(clicked == true && !point_in_rectangle(touchX, touchY, x1, y1, x2, y2)) {
	unclick_button();	
}


var _conditions = conditions();
if(enabled == false && _conditions == true) {
	enable_button();	
}

else if(enabled == true && _conditions == false) {
	disable_button();	
}
