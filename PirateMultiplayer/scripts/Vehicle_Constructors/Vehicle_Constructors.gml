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
	lobby = -1;
	gameStatus = GAME_STATUS.IDLE;
	ready = false;
	hp = 3;
	mx = 0;
	my = 0;
}
function add_physics() constructor {
		xSpeed = 0;
		ySpeed = 0;
		dir = 0;
		velocity = new vector(0, 0);
		acceleration = new vector(0, 0);
	}	
	
function create_vehicle(_team = TEAM.BROWN, _vehicle = HULL.A) constructor {
	sprites = new get_vehicle_sprites(_vehicle, _team);
	
	physics = new add_physics();
	
	move = {
		acc :			0.75,		//How fast the tank can accerlate
		backAcc :		0.25,
		maxSpeed :		4,			//Not sued
		turnSpeed :		.5,			//How fast the vehicle can turn
		turnRadius :	1,			//Not used
	}
	weapon = {
		spd :			15,			//Speed of the projectile
		cooldown :		100,		//Time between shots
		damage :		1,			//How much damage a shot does
		bounce :		1,			//How many times can the projectile bounce
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