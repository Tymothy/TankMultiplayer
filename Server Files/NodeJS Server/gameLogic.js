const en = require('./enums.js'); //en short for enums
module.exports = {};
module.exports.getWorldSpawnCoords = function(team){

  let randY = Math.floor(Math.random() * 500 - 250);
  let randX = Math.floor(Math.random() * 500 - 250);
  switch(team){
    case 0:
      var _ret = {
        x : 400 + randX,
        y: 400 + randY,
      }
    break;

    case 1:
      var _ret = {
        x : 800 + randX,
        y: 400 + randY,
      }
    break;

    case 2:
      var _ret = {
        x : 400 + randX,
        y:  800 + randY,
      }
    break;

    case 3:
      var _ret = {
        x : 800+ randX,
        y:  800+ randY,
      }
    break;

  }

  return _ret;
};

module.exports.incrementServerCounter = function() {
  //static serverCounter = 0;
  //serverCounter++;
  setTimeout(incrementServerCounter, 10);
};
module.exports.logPlayerState = function () {
  console.log("Player positions:");
  for(let i = 0; i < playersData.length; i++) {
    console.log(playersData[i].clientID, playersData[i].name, playersData[i].x, playersData[i].y, playersData[i].a);
  }

  //setTimeout(module.exports.logPlayerState, 5000);
};
module.exports.getConnectedPlayerCount = function (array) {
  return array.length;
}

//module.exports = getWorldSpawnCoords;
