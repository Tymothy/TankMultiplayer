/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();
net = {
		x2 : x,
		y2 : y,
		a2 : image_angle,
		newServerStep : 0,
	
		x1 : x,
		y1 : y,
		a1 : image_angle,
		oldServerStep : 0,
		
		//Always should be behind the player
		x0 : x,
		y0 : y,
		a0 : 0,
		
		stepsSinceLastUpdate: 0,
		stepArray : [],//Creating an array, guessing 5 steps per update
		stepsPerUpdate: 5, 
		dist1 : 0,
		dist2 : 0,
		targDist: 0,
		targA : 0,
		
		xArray : [],
		yArray : [],
		aArray : [],
	}
net.stepArray = array_create(10, 5);
net.xArray = array_create(20, 0);
net.yArray = array_create(20, 0);
net.aArray = array_create(20, 0);
//the values we want to lerp to
//playerData.xTo = x;
//playerData.yTo = y;
//playerData.aTo = image_angle;
//vehData.physics.velocity.vx = 0;
//vehData.physics.velocity.vy = 0;

framesSinceLastUpdate = 0;
aliveFrames = 0;
lastUpdatePacket = 0;
show_debug_message("Created obj_other");

alarm[0] = 15; //Add debug points

updatePos = function(_data) {
	net.x0 = net.x1;
	net.y0 = net.y1;
	net.a0 = net.a1;
	
	//Copy the most recent values object has to the old values
	net.x1 = net.x2;
	net.y1 = net.y2;
	net.a1 = net.a2;
	//net.oldServerStep = net.newSeverStep;
	
	net.newSeverStep = _data.timeStep;
	net.x2 = _data.x;
	net.y2 = _data.y;
	net.a2 = _data.a;
	//if(_data.timeStep % 200 == 0) show_debug_message(string(_data)); //should output every 10 secs

	//Calculate the next 10 steps for client
	
	net.dist1 = point_distance(x, y, net.x1, net.y1);
	net.dist2 = point_distance(net.x1, net.y1, net.x2, net.y2);
	net.targDist = net.dist1 + net.dist2/2;
	net.targA = net.a1 + net.a2/2;
	
	//Calculate stepsPerUpdate by getting average of last 10 updates
	array_insert(net.stepArray, 0, net.stepsSinceLastUpdate);
	array_pop(net.stepArray);
	
	var _average = 0;
	for(var i = 0; i < array_length(net.stepArray) -1; i++) {
		_average += net.stepArray[i];
	}
	_average /= array_length(net.stepArray);
	net.stepsPerUpdate = _average;
	net.stepsSinceLastUpdate = 0;
	
	//Get to targ dist in expected steps per update
	var _targStepDist = net.targDist / net.stepsPerUpdate;
	var _targStepA = net.targA / net.stepsPerUpdate;
	
	//Calculate target coords
	//We want to hit x1 first, then go towards x2
	//We calcuate some vars into the future just incase the next packet is far behind
	net.xArray = array_create(10, 0);
	net.yArray = array_create(10, 0);
	net.aArray = array_create(10, 0);
	net.xArray[0] = round(x);
	net.yArray[0] = round(y);
	net.aArray[0] = image_angle;
	var _dir1 = point_direction(x, y, net.x1, net.y1);
	var _dir2 = point_direction(net.x1, net.y1, net.x2, net.y2);
	var _dir3 = point_direction(x, y, net.x2, net.y2);
	for(var i = 1; i < array_length(net.xArray) - 1; i++) {
		//Target to go through x1 at 66% of stepsPerUpdate
		//var _dir = _dir2
		var _dir = _dir3
		//if(i < net.stepsPerUpdate / 2) {
		//	var _dir = _dir1
		//}
		net.xArray[i] = round(net.xArray[i-1] + lengthdir_x(_targStepDist, _dir));
		net.yArray[i] = round(net.yArray[i-1] + lengthdir_y(_targStepDist, _dir));
		net.aArray[i] = round(net.aArray[i-1] + _targStepA);
	}
	//if(net.newServerStep % 10 == 0) show_debug_message(string(net.xArray));
}
