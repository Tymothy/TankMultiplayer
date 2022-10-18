/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

x = round(lerp(x, playerData.xTo, .1));
y = round(lerp(y, playerData.yTo, .1));
image_angle = round(lerp(image_angle, playerData.aTo, .1));
playerData.framesSinceLastUpdate++;