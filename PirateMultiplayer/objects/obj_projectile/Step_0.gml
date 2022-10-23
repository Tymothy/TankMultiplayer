/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();


var _xTo = x + property.physics.velocity.vx;
var _yTo = y + property.physics.velocity.vy;


property.angle = point_direction(x, y, _xTo, _yTo) - 90;
x = _xTo;
y = _yTo;


