/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

//the values we want to lerp to
playerData.xTo = x;
playerData.yTo = y;
playerData.aTo = image_angle;
vehData.physics.velocity.vx = 0;
vehData.physics.velocity.vy = 0;

framesSinceLastUpdate = 0;
aliveFrames = 0;
lastUpdatePacket = 0;
show_debug_message("Created obj_other");