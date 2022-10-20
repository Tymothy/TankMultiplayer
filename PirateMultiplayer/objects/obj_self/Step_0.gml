/// @description Insert description here
// You can write your code in this editor

event_inherited();



if(components.controls == true && playerData.hp > 0) {
		
	read_input(input);
	playerData.mx = mouse_x;
	playerData.my = mouse_y;
	
	//TODO: Make these all vectors and steering behaviors for release
	if(input.left.held > 0) {
		image_angle += vehData.move.turnRadius;
	}
	
	if(input.right.held > 0) {
		image_angle -= vehData.move.turnRadius;
	}
	
	if(input.forward.held > 0) {
		var xTo = x + lengthdir_x(vehData.move.maxSpeed, image_angle -90);
		var yTo = y + lengthdir_y(vehData.move.maxSpeed, image_angle -90);
		x = lerp(x, xTo, vehData.move.maxSpeed * vehData.move.acc);
		y = lerp(y, yTo, vehData.move.maxSpeed * vehData.move.acc);
	}

	if(input.backward.held > 0) {
		var xTo = x - lengthdir_x(vehData.move.maxSpeed, image_angle -90);
		var yTo = y - lengthdir_y(vehData.move.maxSpeed, image_angle -90);
		x = lerp(x, xTo, vehData.move.maxSpeed * vehData.move.acc);
		y = lerp(y, yTo, vehData.move.maxSpeed * vehData.move.acc);
	}
	
	if(input.fire.released > 0 && fireCooldown == 0) {
		event_notify(G_EVENT.WEAPON_FIRE);	
		net_send_weapon_fire();

	}
}



//if(input.forward.held > true) x+= 2;