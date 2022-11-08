	//Create network event enum objects.  This should match GameMaker's NET_EVENT enum
module.exports = {};
const S_EVENT = {
  CREATE_SELF: 0,
  UPDATE_POSITION : 1,
  WEAPON_FIRE: 2,
  DAMAGE_SELF : 3,

  //Game logic
  SETUP_ROUND: 		100,
  START_ROUND:		101,
  END_ROUND:			102,

  //Admin


  UPDATE_PLAYER:  203,

}

//Client events
const C_EVENT = {
  CREATE_SELF: 0,
  CREATE_OTHER: 1,
  DESTROY_OTHER: 2,
  UPDATE_POSITION: 3,
  WEAPON_FIRE: 4,
  DAMAGE: 5,

  //Game logic

  //Admin

  GOTO_MAP:       201,
  GAME_CONFIG:    202,
  UPDATE_PLAYER:  203,
  GAME_STATUS:    204,
}

const TEAM = {
  RED : 0,
  BLUE: 1,
}

const GAME_STATUS = {
  IDLE : "IDLE",
  IN_LOBBY : "IN_LOBBY",
  STARTING : "STARTING",
  PLAYING : "PLAYING",
  ENDING : "ENDING",
}

module.exports.S_EVENT =      S_EVENT;
module.exports.C_EVENT =      C_EVENT;
module.exports.TEAM =         TEAM;
module.exports.GAME_STATUS =  GAME_STATUS;
