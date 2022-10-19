/// @description Insert description here
// You can write your code in this editor

event_inherited();



if(components.controls == true) {
		
	read_input(input);
	playerData.mx = mouse_x;
	playerData.my = mouse_y;
	
	//TODO: Make these all vectors and steering behaviors for release
	if(input.left.held > 0) {
		image_angle += shipData.move.turnRadius;
	}
	
	if(input.right.held > 0) {
		image_angle -= shipData.move.turnRadius;
	}
	
	if(input.forward.held > 0) {
		var xTo = x + lengthdir_x(shipData.move.maxSpeed, image_angle -90);
		var yTo = y + lengthdir_y(shipData.move.maxSpeed, image_angle -90);
		x = lerp(x, xTo, shipData.move.maxSpeed * shipData.move.acc);
		y = lerp(y, yTo, shipData.move.maxSpeed * shipData.move.acc);
	}
	
	if(input.fire.released > 0) {
		event_notify(G_EVENT.WEAPON_FIRE);	
		net_send_weapon_fire();
	}
}



//if(input.forward.held > true) x+= 2;