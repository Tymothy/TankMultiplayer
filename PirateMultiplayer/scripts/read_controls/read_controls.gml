function read_controls() {
    var _key = ord("X");
    attack[PRESSED] = keyboard_check_pressed(_key);
    attack[RELEASED] = keyboard_check_released(_key);
    if(keyboard_check(_key))
        attack[HELD]++;
    else
        attack[HELD] = false;

    _key = ord("C");
    jump[PRESSED] = keyboard_check_pressed(_key);
    jump[RELEASED] = keyboard_check_released(_key);
    if(keyboard_check(_key))
        jump[HELD]++;
    else
        jump[HELD]=0;
    
    _key = vk_space;
    slide_dash[PRESSED] = keyboard_check_pressed(_key);
    slide_dash[RELEASED] = keyboard_check_released(_key);
    if(keyboard_check(_key))
        slide_dash[HELD]++;
    else
        slide_dash[HELD]=0;    
    
    _key = vk_left;
    left[PRESSED] = keyboard_check_pressed(_key);
    left[RELEASED] = keyboard_check_released(_key);
    left[HELD] = keyboard_check(_key);

    _key = vk_right;
    right[PRESSED] = keyboard_check_pressed(_key);
    right[RELEASED] = keyboard_check_released(_key);
    right[HELD] = keyboard_check(_key);

    var _h = right[HELD]-left[HELD];
    if(point_distance(0, 0, _h, 0) > 0)
        dpad_dir=round(point_direction(0, 0, _h, 0));
    else
        dpad_dir=NO_DIRECTION;
}

function zero_controls(){
    attack[PRESSED] = false;
    attack[RELEASED] = false;
    attack[HELD] = false;
        
    jump[PRESSED] = false;
    jump[RELEASED] = false;
    jump[HELD] = 0;
    
    slide_dash[PRESSED] = false;
    slide_dash[RELEASED] = false;
    slide_dash[HELD]=0;    
    
    left[PRESSED] = false;
    left[RELEASED] = false;
    left[HELD] = 0;

    right[PRESSED] = false;
    right[RELEASED] = false;
    right[HELD] = 0;
    
    dpad_dir = NO_DIRECTION;
}