/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

if(active == true) {
	//Field is being set	
	if(instance_exists(obj_input)){
		usernameString = obj_input.viewString();
		property.text = "Username\n" + usernameString;
	} else {
		
		obj_playerData.setUsername(usernameString);
		property.text = obj_playerData.username;
		active = false;	
	}
}