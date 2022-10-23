/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

//Original code
//image_angle = round(lerp(image_angle, playerData.aTo, .5));

//Prediction
//if(vehData.physics.velocity.vx != 0) {
//	show_message(string(vehData.physics.velocity.vx));
//	show_message(string(vehData.physics.velocity.vy));
//}

	//var _vx = vehData.physics.velocity.vx;
	//var _vy = vehData.physics.velocity.vy;
	//if(is_undefined(_vx)) _vx = 0;
	//if(is_undefined(_vy)) _vy = 0;
	
	////Prediction front and back is good.
	//var _xTo = playerData.xTo + (_vx * framesSinceLastUpdate);
	//var _yTo = playerData.yTo + (_vy * framesSinceLastUpdate);
	
	//x = lerp(x,_xTo, .8);
	//y = lerp(y, _yTo, .8);
	//image_angle = round(lerp(image_angle, playerData.aTo, .5));
	////show_debug_message("xTo: " + string(playerData.xTo) + " yTo:" + string(playerData.yTo));
	////x = lerp(x, playerData.xTo + (_vx * framesSinceLastUpdate), .35);
	////y = lerp(y, playerData.yTo + (_vy * framesSinceLastUpdate), .35);
	
	//Set a path from current X to old X if we have not reached it yet, then to new X


		//Create a line between X, old and new
		//We never want to reach new before a new is received
		

		
		//var _xDist1 = net.x1 - x;
		//var _yDist1 = net.y1 - y;
		//var _aDist1 = net.a1 - image_angle;

		//var _xDist = net.x2 - net.x1;
		//var _yDist = net.y2 - net.y1;
		//var _aDist = net.a2 - net.a1;

		////var _xDist = net.newXTo - x;
		////var _yDist = net.newYTo - y;
		////var _aDist = net.newATo - image_angle;
		////Dist is the maxium distance we can go before receiving a new packet.
		////We should receive a packet every 50 ms to 100 ms
		////Because we are running ~ 60 steps a second, we should plan for 10 steps to reach
		////The new values from the old values
	
		////We want to travel this distance each step
		//var _stepX = _xDist / 10;
		//var _stepY = _yDist / 10;
		//var _stepA = _aDist / 10;
	
		////Potential bug, if we reach new xTo, we should
		//var _frameXTo = x + _stepX;
		//var _frameYTo = y + _stepY;
		//var _frameATo = image_angle + _stepA;
	
		//x = _frameXTo;
		//y = _frameYTo;
		//image_angle = _frameATo;
		//if(_xDist > 1) show_message(string(net) + string(_xDist) + " " + string(_stepX) + " " + string(_stepY));
		
		//Only run if we have not run out of space in our array
		if(net.stepsSinceLastUpdate < array_length(net.xArray)-2) {
			x = net.xArray[net.stepsSinceLastUpdate];
			y = net.yArray[net.stepsSinceLastUpdate];
			image_angle = net.a1;
		}
		net.stepsSinceLastUpdate++;
	
	
	
framesSinceLastUpdate++;
aliveFrames++;