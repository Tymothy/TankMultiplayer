/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

if(net_get_status() == true) {
	property.text = "Connected to\nServer";
	property.textColor = c_lime;
} else {
	property.text = "Not Connected\nTo Server";		
	property.textColor = c_red;
}