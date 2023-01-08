/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();
components.controls = true;


if(components.controls == true) input = new add_controls();

var breakpoint = 0;

move = use_tdmc();

setPosition = function (_data) {
	//Accepts an array with 2 values, x and y	
	x = _data[0];
	y = _data[1];
}