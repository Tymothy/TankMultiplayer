/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

		//Only run if we have not run out of space in our array
		if(net.stepsSinceLastUpdate < array_length(net.xArray)-2) {
			x = net.xArray[net.stepsSinceLastUpdate];
			y = net.yArray[net.stepsSinceLastUpdate];
			image_angle = net.a1;
			net.mx = net.mxArray[net.stepsSinceLastUpdate];
			net.my = net.myArray[net.stepsSinceLastUpdate];
			playerData.mx = net.mx;
			playerData.my = net.my;
			//show_debug_message("MX: " + string(net.mx) + " MY: " + string(net.my));
		}
		net.stepsSinceLastUpdate++;
	
	
	
framesSinceLastUpdate++;
aliveFrames++;