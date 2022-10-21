/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();
var _xTo = x + lengthdir_x(property.spd, property.dir);
var _yTo = y + lengthdir_y(property.spd, property.dir);

property.angle = point_direction(x, y, _xTo, _yTo) - 90;
x = _xTo;
y = _yTo;


