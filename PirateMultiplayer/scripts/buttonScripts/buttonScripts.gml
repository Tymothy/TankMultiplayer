enum B_ANI {
	NONE,
	
}

function create_button (_obj, _anchor, _x, _y, _animation = B_ANI.NONE, _layer = "lay_gui_back") {
	
	
	var _inst = instance_create_layer(0, 0, _layer, _obj);
	with (_inst) {
		property.x = _x;
		property.y = _y;
		property.anchor = _anchor;
		property.animation = _animation;
	}
	
	
	
}