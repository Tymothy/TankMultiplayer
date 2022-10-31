{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rm_mainMenu",
  "isDnd": false,
  "volume": 1.0,
  "parentRoom": {
    "name": "rm_parent",
    "path": "rooms/rm_parent/rm_parent.yy",
  },
  "views": [
    {"inherit":true,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":true,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":true,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":true,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":true,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":true,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":true,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":true,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
  ],
  "layers": [
    {"resourceType":"GMRLayer","resourceVersion":"1.0","name":"GUI","visible":true,"depth":0,"userdefinedDepth":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"gridX":16,"gridY":16,"layers":[
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"lay_gui_top","instances":[],"visible":true,"depth":100,"userdefinedDepth":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"lay_gui_middle","instances":[],"visible":true,"depth":200,"userdefinedDepth":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"lay_gui_back","instances":[],"visible":true,"depth":300,"userdefinedDepth":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
      ],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRLayer","resourceVersion":"1.0","name":"PlayArea","visible":true,"depth":400,"userdefinedDepth":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"gridX":16,"gridY":16,"layers":[
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"lay_playerInfo","instances":[],"visible":true,"depth":500,"userdefinedDepth":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"lay_projectiles","instances":[],"visible":true,"depth":600,"userdefinedDepth":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"lay_players","instances":[],"visible":true,"depth":700,"userdefinedDepth":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
      ],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRLayer","resourceVersion":"1.0","name":"Map","visible":true,"depth":800,"userdefinedDepth":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"gridX":16,"gridY":16,"layers":[
        {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"lay_ground","tilesetId":{"name":"ts_ground","path":"tilesets/ts_ground/ts_ground.yy",},"x":0,"y":0,"tiles":{"TileDataFormat":1,"SerialiseWidth":25,"SerialiseHeight":25,"TileCompressedData":[
-625,-2147483648,],},"visible":true,"depth":900,"userdefinedDepth":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"lay_walls","instances":[],"visible":true,"depth":1000,"userdefinedDepth":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
      ],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","instances":[],"visible":true,"depth":1100,"userdefinedDepth":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"lay_bg_error","spriteId":{"name":"spr_error","path":"sprites/spr_error/spr_error.yy",},"colour":4294967295,"x":0,"y":0,"htiled":true,"vtiled":true,"hspeed":0.0,"vspeed":0.0,"stretch":false,"animationFPS":30.0,"animationSpeedType":0,"userdefinedAnimFPS":false,"visible":true,"depth":1200,"userdefinedDepth":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
  ],
  "inheritLayers": true,
  "creationCodeFile": "",
  "inheritCode": true,
  "instanceCreationOrder": [],
  "inheritCreationOrder": true,
  "sequenceId": null,
  "roomSettings": {
    "inheritRoomSettings": true,
    "Width": 6400,
    "Height": 6400,
    "persistent": false,
  },
  "viewSettings": {
    "inheritViewSettings": true,
    "enableViews": false,
    "clearViewBackground": false,
    "clearDisplayBuffer": true,
  },
  "physicsSettings": {
    "inheritPhysicsSettings": true,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "parent": {
    "name": "Rooms",
    "path": "folders/Rooms.yy",
  },
}