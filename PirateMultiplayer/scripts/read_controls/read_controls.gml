function add_controls() constructor{
	//left = 0;
	//right = 0;
	//forward = 0;
	//fire = 0;
	//interact = 0;
	
	left =		new add_controls_ext(ord("A"));
	right =		new add_controls_ext(ord("D"));
	forward =	new add_controls_ext(ord("W"));
	fire =		new add_controls_ext(vk_space);
	interact =	new add_controls_ext(ord("E"));	
}

function add_controls_ext(_key) constructor {
	key =		_key; //Key used to track pressed, released, or held
	pressed =	0;
	released =	0;
	held =		0;
}


function read_input(_input) {
	//var _1 will hold the first level of variables.  The struct variables created from add_controls()
	//var _2 will hold the second level of variables. The struct variables created from add_controls_ext()
	
	var _1 = variable_struct_get_names(_input);
	var _2 = variable_struct_get_names(_input[$ _1[0]]);

	//Iterate through all root level variables in given input struct
	for(var i = 0; i < array_length(_1); i++) {
		var _key = _input[$ _1[i]][$ "key"];
		_input[$ _1[i]][$ "pressed"] = keyboard_check_pressed(_key);
		_input[$ _1[i]][$ "released"] = keyboard_check_released(_key);
		
		if(keyboard_check(_key)) {
			_input[$ _1[i]][$ "held"]++;
			//show_debug_message("Key " + string(_input[$ _1[i]]) + " has been held for " + string(_input[$ _1[i]][$ "held"]) + " frames");
		}
		else {
			_input[$ _1[i]][$ "held"] = 0;
		}

	}

	//Handle left input
	//var _key = ord("W"); 
	//left[PRESSED] = keyboard_check_pressed(_key);
	//left[RELEASED] = keyboard_check_released(_key);
    //if(keyboard_check(_key))
    //   left[HELD]++;
    //else
    //    left[HELD]=0;	
		
	////Handle right input	
	//_key = ord("D");
    //right[PRESSED] = keyboard_check_pressed(_key);
    //right[RELEASED] = keyboard_check_released(_key);
    //if(keyboard_check(_key))
    //   right[HELD]++;
    //else
    //    right[HELD]=0;		
		
	////Handle forward input	
    //_key = ord("W");
    //forward[PRESSED] = keyboard_check_pressed(_key);
    //forward[RELEASED] = keyboard_check_released(_key);
    //if(keyboard_check(_key))
    //   forward[HELD]++;
    //else
    //    forward[HELD]=0;			
		
	////Handle fire input
    //_key = ord(vk_space);
    //fire[PRESSED] = keyboard_check_pressed(_key);
    //fire[RELEASED] = keyboard_check_released(_key);
    //if(keyboard_check(_key))
    //   fire[HELD]++;
    //else
    //    fire[HELD]=0;	
	
	////Handle interact input
	//_key = ord("E");
    //interact[PRESSED] = keyboard_check_pressed(_key);
    //interact[RELEASED] = keyboard_check_released(_key);
    //if(keyboard_check(_key))
    //   interact[HELD]++;
    //else
    //    interact[HELD]=0;	
	
	/*
	//Template
    _key = ord("C");
    X[PRESSED] = keyboard_check_pressed(_key);
    X[RELEASED] = keyboard_check_released(_key);
    if(keyboard_check(_key))
       X[HELD]++;
    else
        X[HELD]=0;	
	*/

	/*
	DPAD Stuff
    var _h = right[HELD]-left[HELD];
    if(point_distance(0, 0, _h, 0) > 0)
        dpad_dir=round(point_direction(0, 0, _h, 0));
    else
        dpad_dir=NO_DIRECTION;
		*/
}

function zero_controls(){
    left[PRESSED] = false;
    left[RELEASED] = false;
    left[HELD] = false;

    right[PRESSED] = false;
    right[RELEASED] = false;
    right[HELD] = false;
	
	forward[PRESSED] = false;
    forward[RELEASED] = false;
    forward[HELD] = false;
	
	fire[PRESSED] = false;
    fire[RELEASED] = false;
    fire[HELD] = false;
	
	interact[PRESSED] = false;
    interact[RELEASED] = false;
    interact[HELD] = false;

   
}