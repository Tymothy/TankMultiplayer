/// @description Create grid selection object

//Needs to be an alarm as co_touchMaster needs
if(instance_exists(co_touchGridSelect))
{
	instance_destroy(co_touchGridSelect)	
}

var _obj = instance_create_depth(x, y, -1001, co_touchGridSelect);
_obj.my_touch = my_touch;
_obj.indicatorID = id;