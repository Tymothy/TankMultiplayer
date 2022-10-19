#region Networking
#macro SERVER_IP "54.245.7.200"
#macro SERVER_PORT 10027

#macro UPDATE_RATE 2 //Rate at which we send updates about player to server

#endregion

//Direction
#macro NO_DIRECTION -1
#macro EAST 0
#macro NORTH_EAST 45
#macro NORTH 90
#macro NORTH_WEST 135
#macro WEST 180
#macro SOUTH_WEST 225
#macro SOUTH 270
#macro SOUTH_EAST 315
#macro HORIZONTAL 0
#macro VERTICAL 1

//Input
#macro HELD 0
#macro PRESSED 1
#macro RELEASED 2

//VIEW
#macro BASE_W 480
#macro BASE_H 270
#macro VIEW view_camera[0]
#macro VIEW_W camera_get_view_width(VIEW)
#macro VIEW_H camera_get_view_height(VIEW)

#macro DISP_W display_get_width()
#macro DISP_H display_get_height()

#macro WIN_W window_get_width()
#macro WIN_H window_get_height()

//Config variables
#macro ADMIN 0
#macro LOGGING 0
#macro VISUAL_DEBUG 0
#macro UNLOCK_ALL 0
#macro CONFIGURATION 0
#macro live_enabled 0 // flip this value to 0 to disable GMLive!
#macro ZOOM 0
#macro DOOR_UNLOCK 0 //Controls whether doors are locked to allow pathing
#macro TEST 0

#macro test:ADMIN 1
#macro test:LOGGING 1
#macro test:VISUAL_DEBUG 1
#macro test:UNLOCK_ALL 1
#macro test:CONFIGURATION 1 
#macro test:live_enabled 1 // flip this value to 0 to disable GMLive!
#macro test:ZOOM 1
#macro test:DOOR_UNLOCK 0
#macro test:TEST 1