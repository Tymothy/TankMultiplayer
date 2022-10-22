/// @description Insert description here
// You can write your code in this editor

event_inherited();

var _dirChange = 0;
var _accChange = 0;
var _accX = 0;
var _accY = 0;	
//var _accX = lengthdir_x(vehData.move.acc, _currentDir);
//var _accY = lengthdir_y(vehData.move.acc, _currentDir);		


if(components.controls == true && playerData.hp > 0) {
		
	read_input(input);	
	playerData.mx = mouse_x;
	playerData.my = mouse_y;
	
	//Apply controls
	if(input.left.held > 0) {
		_dirChange += vehData.move.turnRadius;
	}
	
	if(input.right.held > 0) {
		_dirChange -= vehData.move.turnRadius;
	}
	vehData.physics.dir += _dirChange;
	
	
	if(input.forward.held > 0) {
		//var _accX = lengthdir_x(vehData.move.acc, _currentDir);
		//var _accY = lengthdir_y(vehData.move.acc, _currentDir);			
		_accChange += vehData.move.acc;
		//move.spdDir(vehData.move.maxSpeed, dir);
	}

	if(input.backward.held > 0) {
		//var _accX = lengthdir_x(-vehData.move.backAcc, _currentDir);
		//var _accY = lengthdir_y(-vehData.move.backAcc, _currentDir);
		_accChange -= vehData.move.backAcc;
		//move.spdDir(-vehData.move.maxSpeed, dir);
	}
	
	if(input.fire.released > 0 && fireCooldown == 0) {
		event_notify(G_EVENT.WEAPON_FIRE);	
		net_send_weapon_fire();
	}
	
	//Apply movement, this should be taken out of the controls block in future
	var _accX = lengthdir_x(_accChange, vehData.physics.dir);
	var _accY = lengthdir_y(_accChange, vehData.physics.dir);
	
	vehData.physics.acceleration.set(_accX, _accY);
	vehData.physics.velocity.add(vehData.physics.acceleration);
	
	//Friction
	vehData.physics.velocity.multiply(.9);
	
	var _xTo = x + vehData.physics.velocity.x;
	var _yTo = y + vehData.physics.velocity.y;
	var _spd = point_distance(x, y, _xTo, _yTo);
	var _dir = point_direction(x, y, _xTo, _yTo);
	move.spdDir(_spd, _dir);
	//x += vehData.physics.velocity.x;
	//y += vehData.physics.velocity.y;
	image_angle = vehData.physics.dir + 90;
	
}



//if(input.forward.held > true) x+= 2;