/// @description
str = "";
blinker = false;
keyboard_string = "";

viewString =  function () {
	//Shows string with blinker
	var _ret = str;
	if(blinker == true) {
		_ret += "_";	
	}
	return _ret;
}

setString = function () {
	//Set the string no blinker
	return str;
}

//alarm[0] = 10;
