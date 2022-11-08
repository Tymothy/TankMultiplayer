/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

property.text = "NaN";
property.anchor = ANCHOR.BOTTOM_LEFT;
property.x = 0;
property.y = -1;
property.width = 2;
property.height = 1;
property.defaultColor = c_orange;
property.onClickColor = c_red;


create_update();

activate_button = function() {

	if(instance_exists(obj_self)) {
		var _team = TEAM.BLUE; //Set to team blue by default
		switch(obj_self.playerData.team) {
			case TEAM.BLUE:
				_team = TEAM.RED;
				break;
			
			case TEAM.RED:
				_team = TEAM.BLUE;
				break;
		
		}
	
		var _obj = {
			team : _team,	
		}
		net_send_update_player(_obj);
	}
}