/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

//Original code
image_angle = round(lerp(image_angle, playerData.aTo, .5));

//Prediction
//if(vehData.physics.velocity.vx != 0) {
//	show_message(string(vehData.physics.velocity.vx));
//	show_message(string(vehData.physics.velocity.vy));
//}

	var _vx = vehData.physics.velocity.vx;
	var _vy = vehData.physics.velocity.vy;
	if(is_undefined(_vx)) _vx = 0;
	if(is_undefined(_vy)) _vy = 0;
	
	//Prediction front and back is good.
	var _xTo = playerData.xTo + (_vx * framesSinceLastUpdate);
	var _yTo = playerData.yTo + (_vy * framesSinceLastUpdate);
	
	x = lerp(x,_xTo, .8);
	y = lerp(y, _yTo, .8);
	image_angle = round(lerp(image_angle, playerData.aTo, .5));
	//show_debug_message("xTo: " + string(playerData.xTo) + " yTo:" + string(playerData.yTo));
	//x = lerp(x, playerData.xTo + (_vx * framesSinceLastUpdate), .35);
	//y = lerp(y, playerData.yTo + (_vy * framesSinceLastUpdate), .35);
	
framesSinceLastUpdate++;
aliveFrames++;