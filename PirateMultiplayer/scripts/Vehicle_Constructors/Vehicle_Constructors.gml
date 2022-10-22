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
	vehicle = VEHICLE.LARGE;
	mx = 0;
	my = 0;
}
function add_physics() constructor {
		xSpeed = 0;
		ySpeed = 0;
		dir = 0;
	}	
	
function create_vehicle(_team = TEAM.BROWN, _vehicle = HULL.A) constructor {
	sprites = new get_vehicle_sprites(_vehicle, _team);
	
	physics = new add_physics();
	
	move = {
		acc : 1,
		maxSpeed : 4,
		turnSpeed : .3,
		turnRadius : 1,	
	}
	weapon = {
		spd	:		3,
		cooldown :	100,	
		damage :	1,
	}
	
	
}


function get_vehicle_sprites(_team = TEAM.BROWN, _vehicle = HULL.A) constructor{
	switch(_team) {

		
		case TEAM.BLUE:
			hull = spr_hull_blue;
			gun = spr_gun_blue;
		break;
		
		case TEAM.GREEN:
			hull = spr_hull_green;	
			gun = spr_gun_green;
		break;

		case TEAM.TEAL:
			hull = spr_hull_teal;
			gun = spr_gun_teal;
		break;
		
		case TEAM.BROWN:
			hull = spr_hull_brown;
			gun = spr_gun_brown;
		break;
		
		
	}
}