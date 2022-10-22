///@func use_tdmc([place meeting func = place_meeting], [corner slip = 16], [corner slip speed = .5], [sprite catchup factor = .5])
function use_tdmc(
  _placeMeeting = function(_x, _y){
    return place_meeting(_x, _y, obj_wall); //Replace objWall with your object 
  }, 
  _cornerSlip = 16, 
  _slipSpd = .5, 
  _catchupFactor = .5) {
    
  return {
    drawX: id.x,
    drawY: id.y,
    againstWall: { hori: 0, vert: 0 },
    
    __iXSpdLeft: 0,
    __iYSpdLeft: 0,
    __iCornerSlip: _cornerSlip,
    __iCornerSlipSpeedFactor: _slipSpd,
    __iOwner: id,
    __iIgnoreCollision: false,
    __iSpriteCatchupFactor: _catchupFactor,
    
    __iPlaceMeeting: _placeMeeting,
    
    __iCornerSlipVert: function(_dir) {
    	for(var _i = 1; _i <= __iCornerSlip; _i++) {
    		if(!__iPlaceMeeting(__iOwner.x + _dir, __iOwner.y - _i)) return -1;	
        if(!__iPlaceMeeting(__iOwner.x + _dir, __iOwner.y + _i)) return 1;
      }
    	return 0;
    },

    __iCornerSlipHori: function(_dir) {
    	for(var _i = 1; _i <= __iCornerSlip; _i++) {
    		if(!__iPlaceMeeting(__iOwner.x - _i, __iOwner.y + _dir)) return -1;	
        if(!__iPlaceMeeting(__iOwner.x + _i, __iOwner.y + _dir)) return 1;
      }
    	return 0;
    },
    
    __iApproach: function(_start, _target, _step) {
    	if (_start < _target)
    	    return min(_start + _step, _target); 
    	else
    	    return max(_start - _step, _target);
    },
    
    __iUpdateDrawPos: function() {
      drawX = lerp(drawX, __iOwner.x, __iSpriteCatchupFactor);
      drawY = lerp(drawY, __iOwner.y, __iSpriteCatchupFactor);
    },
    
    __iGtfo: function() {
      var _precision = 1; //Feel free to adjust this to be higher. 1 is a bit extreme
      if(!__iPlaceMeeting(__iOwner.x, __iOwner.y)) return;
      var _curRad = _precision;
      var _startX = __iOwner.x;
      var _startY = __iOwner.y;
      while(true) {
        for(var _x = -_curRad; _x <= _curRad; _x += _precision) {
          for(var _y = -_curRad; _y <= _curRad; _y += _precision) {
            if(_x > _curRad && _y > _curRad && _x < _curRad && _y < _curRad) continue;
            __iOwner.x = _startX + _x; 
            __iOwner.y = _startY + _y;
            if(!__iPlaceMeeting(__iOwner.x, __iOwner.y)) {
              show_debug_message("Got the F out after " + string(_curRad / _precision) + " iterations");  
              return;
            }
          }
        }
        _curRad += _precision
      }
    },
    
    ///@func spdDir(speed, direction)
    spdDir: function(_spd, _dir) {
      xSpdYSpd(lengthdir_x(_spd, _dir), lengthdir_y(_spd, _dir))
    },
    
    ///@func xSpdYSpd(x speed, y speed)
    xSpdYSpd: function(_xSpd, _ySpd) {
      __iGtfo();
    	
      againstWall.hori = 0; againstWall.vert = 0;
      
      __iXSpdLeft += _xSpd;
      __iYSpdLeft += _ySpd;
      
      var _againstVert = 0, _againstHori = 0;
      var _timeout = ceil(abs(__iXSpdLeft) + abs(__iYSpdLeft)) * 10;
      var _timeoutTimer = 0;
	    while(abs(__iXSpdLeft) >= 1 || abs(__iYSpdLeft) >= 1) {
    		
        //Hori
        if(abs(__iXSpdLeft) >= 1) {
          var _dir = sign(__iXSpdLeft);
          __iXSpdLeft = __iApproach(__iXSpdLeft, 0, 1);
          if(__iIgnoreCollision || !__iPlaceMeeting(__iOwner.x + _dir, __iOwner.y)) {
            __iOwner.x += _dir;
            _againstHori = 0;
          } else {
            _againstHori = _dir;
            if(!__iPlaceMeeting(__iOwner.x + _dir, __iOwner.y - 1))
              __iYSpdLeft -= 1;
    				else if(!__iPlaceMeeting(__iOwner.x + _dir, __iOwner.y + 1))
    					__iYSpdLeft += 1;
            else
              againstWall.hori = _dir;  
          }
        } 
        
    		//Vert
        if(abs(__iYSpdLeft) >= 1) {
          var _dir = sign(__iYSpdLeft);
          __iYSpdLeft = __iApproach(__iYSpdLeft, 0, 1);
          if(__iIgnoreCollision || !__iPlaceMeeting(__iOwner.x, __iOwner.y + _dir)) {
            __iOwner.y += _dir;
            _againstVert = 0;
          } else {
            _againstVert = _dir;
            if(!__iPlaceMeeting(__iOwner.x - 1, __iOwner.y + _dir))
              __iXSpdLeft -= 1;
    				else if(!__iPlaceMeeting(__iOwner.x + 1, __iOwner.y + _dir))
    					__iXSpdLeft += 1;	
            else
              againstWall.vert = _dir;  
          }
        } 
        _timeoutTimer++;
        if(_timeoutTimer > _timeout) {
          __iXSpdLeft = 0;
          __iYSpdLeft = 0;
          break;  
        }
    	}
      
      //Go around Corners
      if(againstWall.hori != 0 && againstWall.vert == 0) {
          __iYSpdLeft += (__iCornerSlipVert(againstWall.hori) * __iCornerSlipSpeedFactor);
      }
      
      if(againstWall.vert != 0 && againstWall.hori == 0) {
          __iXSpdLeft += (__iCornerSlipHori(againstWall.vert) * __iCornerSlipSpeedFactor);
      }
      
      if(_againstVert != 0 || _againstHori != 0) {
        againstWall.hori = _againstHori;
        againstWall.vert = _againstVert;
      }
      __iUpdateDrawPos();
    }
  }
}