#macro TILE_SIZE 64
#macro DRAG_TIME_MIN 45 //How long player has to hold on a tile after dragging a tile.  Time in steps to calculate dragging
#macro NATIVE_WIDTH 1920
#macro NATIVE_HEIGHT 1080

enum 	T_STATE{
	IDLE,
	NEW_TOUCH,
	SAME_TOUCH,
	DIFFERENT_TOUCH,
	DRAGGING,
	RELEASE,
}


enum ANCHOR {
	//Controls where the GUI is anchored at
	TOP_LEFT,
	TOP_CENTER,
	TOP_RIGHT,
	MIDDLE_LEFT,
	MIDDLE_CENTER,
	MIDDLE_RIGHT,
	BOTTOM_LEFT,
	BOTTOM_CENTER,
	BOTTOM_RIGHT,
	
}