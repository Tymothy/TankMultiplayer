/*
function <NAME>(_var1, _var2, _var3...) {
/// @desc ...
/// @arg ....
/// @arg ....
//CODE
}
*/
function create_player() constructor{
	
	clientID = -1;
	name = "";
	team = "";
	hp = 3;
	ship = SHIP.LARGE;
	mx = 0;
	my = 0;
}


function create_vehicle(_ship = SHIP.SMALL, _team = TEAM.WHITE) constructor {
	sprites = new get_vehicle_sprites(_ship, _team);
	move = {
		acc : .5,
		maxSpeed : 1,
		turnSpeed : .3,
		turnRadius : 1,	
	}
	weapon = {
		cooldown : 100,	
	}
	
	
}

//function update_ship() constructor{
//	sprites = new get_vehicle_sprites(playerData.ship, playerData.team);
	
//}

function get_vehicle_sprites(_ship = SHIP.SMALL, _team = TEAM.WHITE) constructor{
	switch(_ship) {
		case SHIP.LARGE: 
			hull = spr_hull_large;
			break;
			
		case SHIP.SMALL:
			hull = spr_hull_small;
			break;
	}
	
	switch(_team) {
		case TEAM.RED:
			sailLarge = spr_sail_large_red;
			sailSmall = spr_sail_small_red;
			flag = spr_flag_red;
		break;
		
		case TEAM.BLUE:
			sailLarge = spr_sail_large_blue;
			sailSmall = spr_sail_small_blue;
			flag = spr_flag_blue;		
		break;
		
		case TEAM.GREEN:
			sailLarge = spr_sail_large_green;
			sailSmall = spr_sail_small_green;
			flag = spr_flag_green;			
		break;
		
		case TEAM.YELLOW:
			sailLarge = spr_sail_large_yellow;
			sailSmall = spr_sail_small_yellow;
			flag = spr_flag_yellow;			
		break;
		
		case TEAM.WHITE:
			sailLarge = spr_sail_large_white;
			sailSmall = spr_error;
			flag = spr_flag_white;			
		break;
		
		case TEAM.BLACK:
			sailLarge = spr_sail_large_black;
			sailSmall = spr_error;
			flag = spr_flag_black;		
		break;
		
	}
}