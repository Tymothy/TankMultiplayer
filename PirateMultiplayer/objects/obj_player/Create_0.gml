/// @description 

//Put this into a constructor
playerData = new create_player();
shipData = new create_ship();

attachedInstances = [];

fire = false;
image_speed = 0;
//Add to constructor
components = {
	controls : false,
	
}


alarm[0] = 1;

destroy_self = function () {
	//Find attached instances and destroy them	
	for(var i = 0; i < array_length(attachedInstances); i++) {
		instance_destroy(attachedInstances[i]);	
		
	}
	instance_destroy();
	
}

damageSelf = function (_attacker, _type, _damage) {
	//playerData.hp = clamp(playerData.hp - 1, 0, 3);
		net_send_damage_self(_attacker, _type, _damage)
	
}
attachInst = function (_inst) {
	array_push(attachedInstances, _inst);
	with (_inst) {
		property.inst = other;
	}
}