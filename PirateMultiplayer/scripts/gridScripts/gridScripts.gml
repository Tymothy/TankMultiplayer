
function to_grid(_actualCoord){
	//Returns the grid coord given an actual coord
	var _gridCoord = floor(_actualCoord / TILE_SIZE);
	return _gridCoord;
}

function from_grid(_gridCoord){
	//Returns actual coord given a grid coord
	var _actualCoord = _gridCoord * TILE_SIZE + TILE_SIZE / 2;
	return _actualCoord;
}

function released_at_grid_coords (_x, _y){
	/*
	Send coords to co_gameMaster and have co_gameMaster determine what to do with coords
	*/
	
}

