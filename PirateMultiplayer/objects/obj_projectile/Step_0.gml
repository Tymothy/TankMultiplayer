/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();


var _xTo = x + property.physics.velocity.vx;
var _yTo = y + property.physics.velocity.vy;


property.angle = point_direction(x, y, _xTo, _yTo) - 90;
if(place_meeting(_xTo, _yTo, obj_wall)){

	//Projectile will hit a wall.
	if(property.bounce <= 0) {
		destroyProjectile();	
	} else {
		property.bounce--;
		//We need to find out if the projectile hit a horizontal wall or vertical wall
		if(place_meeting(_xTo, y, obj_wall)) {
			//We hit a vertical wall
			xTo = x;
			while (!place_meeting(_xTo + sign(property.physics.velocity.vx), y, obj_wall)) {
				//Move _xTo to be in line with wall
				_xTo +=sign(property.physics.velocity.vx);	
			}
			property.physics.velocity.vx *= -1;
			
		}
		if(place_meeting(x, _yTo, obj_wall)){
			//We hit a horizontal wall	
			_yTo = y;
			while (!place_meeting(x, _yTo + sign(property.physics.velocity.vy), obj_wall)) {
				_yTo +=sign(property.physics.velocity.vy);	
			}
			property.physics.velocity.vy *= -1;
		}
		
	}
	
	
}
x = _xTo;
y = _yTo;


