
function set_resolution(_design_value, _is_design_value_vertical, _is_orientation_vertical, _resize_all_rooms, _scale, _overide_other_value) {
///@func set_resolution(design_value, is_design_vertical, is_orientation_vertical, resize_all_rooms, [scale], [overide_other_value])
///@arg _design_value				  real		width or height of ideal resolution
///@arg _is_design_value_vertical	  boolean	When true, the design_value is condidered as height; when false, as width
///@arg _is_orientation_vertical	  boolean	When true, the screen orientation is considered as portrait; when false, as landscape
///@arg _resize_all_rooms			  boolean	When true: Rooms (except room index 0), will be resized to resulting value
///@arg _scale(optional)			  real		(Optional) Scale the game window to better fit the monitor. Will ommited on any non windows and non macos builds
///@arg _overide_other_value(optional) real		(Optional) Overides the value other than the design_value arg for a custom aspect ratio. Will ommited like scale arg

	///Written by George Kritikos (Harpwood studio) - Based on code written by Pixelated_Pope 
	///@License MIT License https://opensource.org/licenses/MIT
	
	//arguments evaluation
	if _design_value == undefined or _is_design_value_vertical == undefined or _is_orientation_vertical == undefined or _resize_all_rooms == undefined 
	then show_error("Error set_resolution script: Incorect number of arguments. Expected number of arguments are minimum of 4 to maximum of 6.", true);
	
	if 0 then return argument[0]; //A workaround to avoid warnings if you do not pass the optional arguments
	
	if _scale == undefined then _scale = 1;
	
	//detect os_type only if is GMS2 IDE approprate
	var _os_type = undefined;
	_os_type = os_type == os_windows ? os_windows : os_macosx;	
	
	// The design value is either the design width or height. Every calculation in build with Test -> VM get a temporary scaling
	var _desing_width	= os_type == _os_type ? _design_value * _scale : _design_value;
	var _desing_height	= os_type == _os_type ? _design_value * _scale : _design_value;

	var _real_width, _real_height, _aspect_ratio, _ideal_width, _ideal_height;

	if _is_orientation_vertical 
	{
		//dirty way to get portait orientation for os_windows/os_macosx
		_real_width		= os_type == _os_type ? display_get_height()  * _scale : display_get_width(); 
		_real_height	= os_type == _os_type ? display_get_width()	* _scale : display_get_height();
		_aspect_ratio	= _real_width >= _real_height ? _real_height / _real_width : _real_width / _real_height;
	
		if _is_design_value_vertical	//The design value is reffering to vertical so we calculate the horizontal 
		{
			_ideal_height = _desing_height;
			if os_type == _os_type then _ideal_width = _overide_other_value == undefined ? round(_ideal_height * _aspect_ratio) : _overide_other_value * _scale;
			else _ideal_width = round(_ideal_height * _aspect_ratio);
		}
		else							//and vice versa
		{
			_ideal_width = _desing_width;
			if os_type == _os_type then _ideal_height = _overide_other_value == undefined ? round(_ideal_width / _aspect_ratio) : _overide_other_value * _scale;
			else _ideal_height = round(_ideal_width / _aspect_ratio);
		}
	
	}
	else
	{
		_real_width		= os_type == _os_type ? display_get_width()  * _scale : display_get_width();
		_real_height	= os_type == _os_type ? display_get_height() * _scale : display_get_height();
		_aspect_ratio	= _real_width >= _real_height ? _real_height / _real_width : _real_width / _real_height;
	
	
		if _is_design_value_vertical	//The design value is reffering to vertical so we calculate the horizontal 
		{
			_ideal_height = _desing_height;
			if os_type == _os_type then _ideal_width = _overide_other_value == undefined ?  round(_ideal_height / _aspect_ratio) : _overide_other_value * _scale;
			else _ideal_width =  round(_ideal_height / _aspect_ratio);
		}
		else							//and vice versa
		{
			_ideal_width = _desing_width;
			if os_type == _os_type then _ideal_height = _overide_other_value == undefined ? round(_ideal_width * _aspect_ratio) : _overide_other_value * _scale;
			else _ideal_height = round(_ideal_width * _aspect_ratio);
		}
	}
	
	//make the results more pixel perfect friendly
	if _ideal_width & 1 then _ideal_width++;
	if _ideal_height & 1 then _ideal_height++;

	if _resize_all_rooms //apply resolution results to all rooms?
	{
		for (var i = 1; i < room_last; i++) //all rooms except room with index 0, which usually is the init room
		{
			if room_exists(i)
			{
				room_set_width(i, _ideal_width);
				room_set_height(i, _ideal_height);
			}
		}
	}

	application_surface_enable(false);  // false as default behaviour 
	window_set_size(_ideal_width, _ideal_height);
	surface_resize(application_surface, _real_width, _real_height);

	//remove the temporary scaling if building with Test -> VM and apply results in global vars for further use
	global.ideal_width = os_type == _os_type ? _ideal_width / _scale : _ideal_width;
	global.ideal_height = os_type == _os_type ? _ideal_height / _scale : _ideal_height;

	
}


function set_camera(x1, y1, x2, y2) {
///@func set_camera (x1, y1, x2, y2)
///@arg x1 
///@arg y1
///@arg x2
///@arg y2
		
		view_enabled = true;
		view_visible[0] = true;
		view_wport[0] = x2; 
		view_hport[0] = y2; 
	
		view_camera[0] = camera_create_view(x1, y1, view_wport[0], view_hport[0], 0, -1, -1, -1, 0, 0);
}


function set_gui_size(_width, _height) {
///@func set_gui_size(_width, [_height])
///@arg _width 
///@arg _height [optional]

	if 0 then return argument[0];
	
	if _height == undefined then _height = HEIGHT * _width / WIDTH;
	display_set_gui_size(_width, _height);
		
	global.width_gui = _width;
	global.height_gui = _height;
}




