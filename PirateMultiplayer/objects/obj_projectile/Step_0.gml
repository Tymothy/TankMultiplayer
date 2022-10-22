/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

//var _xTo = x + lengthdir_x(property.physics.xSpeed, property.physics.dir);
//var _yTo = y + lengthdir_y(property.physics.ySpeed, property.physics.dir);
var _xTo = x + property.physics.xSpeed;
var _yTo = y + property.physics.ySpeed;


property.angle = point_direction(x, y, _xTo, _yTo) - 90;
x = _xTo;
y = _yTo;


