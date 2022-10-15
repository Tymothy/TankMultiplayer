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