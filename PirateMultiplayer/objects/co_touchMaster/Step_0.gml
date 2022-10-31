/// @description Watch for touches
var _loopTimes = 1;
if(instance_exists(co_touchIndicator))
{
	//If screen is already being touched, loop through up to 10 more times
	_loopTimes = 10;
}
//Create an indicator for a touch
for (var i = 0; i < _loopTimes; i += 1) {
	if (device_mouse_check_button_pressed(i, mb_any)) {
		with (instance_create_depth(device_mouse_x(i), device_mouse_y(i), -1000, co_touchIndicator))
		{
			my_touch = i;
			//Create the inst on touchGrid
			set_touch_grid(my_touch, id, x, y, false);
		}
		
		/*
		Columns are each individual touch instance
		Rows track the data of each instance
		ds_grid_set(touchGrid, col, my_touch, val);

		col
		0 = my_touch
		1 = ID of the instance
		2 = x
		3 = y
		*/
	}
}

#region Determine touch state	
if(touchChange == true) touchChange = false;

currentTouch = get_current_touch();
		
if(currentTouch != -1) {
	hasTouch = true;	
	gridX = get_touch_gridX(currentTouch);
	gridY = get_touch_gridY(currentTouch);
}
else {
	hasTouch = false;	
}
if(currentTouch != -1){
	dragging = get_touch_drag(currentTouch);
}
switch(hasTouch) {
	case true:
	//Screen is being touched
		switch(oldTouch) {
			case -1: 
				//Touch is new from idle.  We will want to do something
				TOUCH_STATE = T_STATE.NEW_TOUCH;
				touch_set();
			break;
					
			default:
				if(oldTouch == currentTouch) {
					//This is the same touch, nothing new
					TOUCH_STATE = T_STATE.SAME_TOUCH;
					touch_set();
				}
				else {
					//Screen was being touched before, and it still is, but with different finger.	
					TOUCH_STATE = T_STATE.DIFFERENT_TOUCH;
					touch_set();
				}
			break;
		}
			
	break;
			
			
	case false:
	//Screen is not being touched
		switch(oldTouch) {
			case -1:
				//No change, stay idle.
				TOUCH_STATE = T_STATE.IDLE;
				
			break;
					
			default:
				//There was a release, see if we want to execute
				TOUCH_STATE = T_STATE.RELEASE;
				releaseX = touchX;
				releaseY = touchY;
				releaseGuiX = touchGuiX;
				releaseGuiY = touchGuiY;
				touch_reset();
				//switch(dragging) {
				//	case false:
				//		//We were not dragging, we want to perform action/movement
				//		TOUCH_STATE = T_STATE.RELEASE;
				//	break;
							
				//	case true:
				//		//We were dragging, we don't want to perform actions/movments
				//		TOUCH_STATE = T_STATE.DRAGGING;
				//	break;	
				//}

			break;
					
		}
	break;
			
}

if(oldTouchState != TOUCH_STATE){
	touchChange = true;
}

#endregion