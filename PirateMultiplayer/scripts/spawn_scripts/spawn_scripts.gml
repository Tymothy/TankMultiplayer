/*
function <NAME>(_var1, _var2, _var3...) {
/// @desc ...
/// @arg ....
/// @arg ....
//CODE
}
*/
function get_spawn_team(_obj){
	var _ret = undefined;
	
	if(variable_struct_exists(_obj, "playerData")) {
		switch(_obj.playerData.team) {
			case TEAM.RED:
				show_debug_message("Team is red");
				_ret= TEAM.RED;
				break;
					
			case TEAM.BLUE:
				show_debug_message("Team is blue");
				_ret = TEAM.BLUE;
				break;
		}
	}
	
	else {
		show_message("Trying to get team of an object that doesn't have a team");	
			
	}
	
	return _ret;
	}