/// @description Insert description here
// You can write your code in this editor
event_inherited();
if(instance_exists(obj_self)) {
	property.text = obj_self.playerData.team;	
}
else {
	property.text = "NaN";	
}


