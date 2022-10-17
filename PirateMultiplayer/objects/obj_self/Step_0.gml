/// @description Insert description here
// You can write your code in this editor


if(components.controls == true) {
		
	read_input(input);

	//TODO: Make these all vectors and steering behaviors for release
	if(input.left.held > 0) {
		image_angle += ship.move.turnRadius;
	}
	
	if(input.right.held > 0) {
		image_angle -= ship.move.turnRadius;
	}
	
	if(input.forward.held > 0) {
		var xTo = x + lengthdir_x(ship.move.maxSpeed, image_angle -90);
		var yTo = y + lengthdir_y(ship.move.maxSpeed, image_angle -90);
		x = lerp(x, xTo, ship.move.maxSpeed * ship.move.acc);
		y = lerp(y, yTo, ship.move.maxSpeed * ship.move.acc);
	}
}



//if(input.forward.held > true) x+= 2;