/// @description 

//Put this into a constructor
playerData = new create_player();
shipData = new create_ship();


fire = false;
image_speed = 0;
//Add to constructor
components = {
	controls : false,
	
}


alarm[0] = 1;

destroy_self = function () {
	//Find attached instances and destroy them	
	
	instance_destroy();
	
}

damageSelf = function (_attacker, _type, _damage) {
	//playerData.hp = clamp(playerData.hp - 1, 0, 3);
	net_send_damage_self(_attacker, _type, _damage)
	
}