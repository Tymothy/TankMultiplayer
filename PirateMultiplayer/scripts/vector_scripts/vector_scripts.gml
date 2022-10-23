/*
function <NAME>(_var1, _var2, _var3...) {
/// @desc ...
/// @arg ....
/// @arg ....
//CODE
}
*/
function vector(_x = 0, _y = 0) constructor {
	vx = _x;
	vy = _y;
	
	static set = function(_x, _y) {
		vx = _x;
		vy = _y;
	}
	
	static add = function(_vector) {
		vx += _vector.vx;
		vy += _vector.vy;
	}
	
	static subtract = function(_vector) {
		vx -= _vector.vx;
		vy -= _vector.vy;
	}
	
	static multiply = function(_scalar) {
		vx *= _scalar;
		vy *= _scalar;
	}
	
	static divide = function(_scalar) {
		vx /= _scalar;
		vy /= _scalar;
	}	
	
}