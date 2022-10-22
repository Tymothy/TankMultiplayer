/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

//Original code
x = round(lerp(x, playerData.xTo, .5));
y = round(lerp(y, playerData.yTo, .5));
image_angle = round(lerp(image_angle, playerData.aTo, .5));

//Prediction

//How much we are moving each frame
//var _pXdiff = x - playerData.xTo;
//var _pYdiff = y - playerData.yTo;
//var _pAdiff = image_angle - playerData.aTo;

//var _pAngle = 
//x = round(lerp(x, playerData.xTo + _pXdiff * playerData.framesSinceLastUpdate, .1));
//y = round(lerp(y, playerData.yTo + _pYdiff * playerData.framesSinceLastUpdate, .1));
//image_angle = round(lerp(image_angle, playerData.aTo + _pYdiff * playerData.framesSinceLastUpdate, .1));

playerData.framesSinceLastUpdate++;