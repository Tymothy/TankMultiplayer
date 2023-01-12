/*
function <NAME>(_var1, _var2, _var3...) {
/// @desc ...
/// @arg ....
/// @arg ....
//CODE
}
*/
function get_self_x(){
	if(object_exists(obj_self)) {
		return obj_self.x;
	}
	else {
		show_message("Unable to find obj_self.  Check get_self_x function called");
	}
	
}

function get_self_y(){
	if(object_exists(obj_self)) {
		return obj_self.y;
	}
	else {
		show_message("Unable to find obj_self.  Check get_self_y function called");
	}
	
}

function set_self_x(_x) {
	if(object_exists(obj_self)) {
		obj_self.x = _x;
	}
	else {
		show_message("Unable to find obj_self.  Check set_self_x function called");
	}		
	
}

function set_self_y(_y) {
	if(object_exists(obj_self)) {
		obj_self.y = _y;
	}
	else {
		show_message("Unable to find obj_self.  Check set_self_x function called");
	}		
	
}