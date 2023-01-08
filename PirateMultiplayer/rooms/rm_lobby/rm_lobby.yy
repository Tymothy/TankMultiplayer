{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rm_lobby",
  "isDnd": false,
  "volume": 1.0,
  "parentRoom": {
    "name": "rm_template",
    "path": "rooms/rm_template/rm_template.yy",
  },
  "views": [
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
  ],
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"lay_controllers","instances":[],"visible":true,"depth":0,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":true,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"lay_markers","instances":[],"visible":true,"depth":100,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":true,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRLayer","resourceVersion":"1.0","name":"GUI","visible":true,"depth":200,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":true,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"lay_gui_top","instances":[],"visible":true,"depth":300,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":true,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"lay_gui_middle","instances":[],"visible":true,"depth":400,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":true,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"lay_gui_back","instances":[],"visible":true,"depth":500,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":true,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
      ],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRLayer","resourceVersion":"1.0","name":"PlayArea","visible":true,"depth":600,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":true,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"lay_playerInfo","instances":[],"visible":true,"depth":700,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":true,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"lay_targets","instances":[
            {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_7137AA2A","properties":[],"isDnd":false,"objectId":{"name":"obj_target","path":"objects/obj_target/obj_target.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":448.0,"y":208.0,},
          ],"visible":true,"depth":800,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":true,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"lay_gun","instances":[],"visible":true,"depth":900,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":true,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"lay_projectiles","instances":[],"visible":true,"depth":1000,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":true,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"lay_players","instances":[],"visible":true,"depth":1100,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":true,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
      ],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRLayer","resourceVersion":"1.0","name":"Map","visible":true,"depth":1200,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":true,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"lay_walls","instances":[],"visible":true,"depth":1400,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":true,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"lay_map_prop_02","instances":[],"visible":true,"depth":1400,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"lay_map_prop_01","instances":[],"visible":true,"depth":1500,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
        {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"lay_building_2","tilesetId":null,"x":0,"y":0,"tiles":{"SerialiseWidth":0,"SerialiseHeight":0,"TileSerialiseData":[
],},"visible":true,"depth":1600,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
        {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"lay_props","tilesetId":null,"x":0,"y":0,"tiles":{"SerialiseWidth":0,"SerialiseHeight":0,"TileSerialiseData":[
],},"visible":true,"depth":1700,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
        {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"lay_building_1","tilesetId":null,"x":0,"y":0,"tiles":{"SerialiseWidth":0,"SerialiseHeight":0,"TileSerialiseData":[
],},"visible":true,"depth":1800,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
        {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"lay_collision_half","tilesetId":null,"x":0,"y":0,"tiles":{"SerialiseWidth":0,"SerialiseHeight":0,"TileSerialiseData":[
],},"visible":true,"depth":1900,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
        {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"lay_collision_full","tilesetId":null,"x":0,"y":0,"tiles":{"SerialiseWidth":0,"SerialiseHeight":0,"TileSerialiseData":[
],},"visible":true,"depth":2000,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
        {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"lay_ground","tilesetId":{"name":"ts_ground","path":"tilesets/ts_ground/ts_ground.yy",},"x":0,"y":0,"tiles":{"TileDataFormat":1,"SerialiseWidth":25,"SerialiseHeight":25,"TileCompressedData":[
-625,-2147483648,],},"visible":true,"depth":1300,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":true,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
      ],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","instances":[],"visible":true,"depth":1500,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":true,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"lay_bg_top","spriteId":null,"colour":4279769112,"x":0,"y":0,"htiled":false,"vtiled":false,"hspeed":0.0,"vspeed":0.0,"stretch":false,"animationFPS":15.0,"animationSpeedType":0,"userdefinedAnimFPS":false,"visible":true,"depth":1600,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":true,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"lay_bg_mid","spriteId":null,"colour":4279769112,"x":0,"y":0,"htiled":false,"vtiled":false,"hspeed":0.0,"vspeed":0.0,"stretch":false,"animationFPS":15.0,"animationSpeedType":0,"userdefinedAnimFPS":false,"visible":true,"depth":1700,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":true,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"lay_bg_back","spriteId":{"name":"spr_bg_metalPanels","path":"sprites/spr_bg_metalPanels/spr_bg_metalPanels.yy",},"colour":4294967295,"x":0,"y":0,"htiled":true,"vtiled":true,"hspeed":0.0,"vspeed":0.0,"stretch":false,"animationFPS":30.0,"animationSpeedType":0,"userdefinedAnimFPS":false,"visible":true,"depth":1800,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":true,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"lay_bg_error","spriteId":{"name":"spr_error","path":"sprites/spr_error/spr_error.yy",},"colour":4294967295,"x":0,"y":0,"htiled":true,"vtiled":true,"hspeed":0.0,"vspeed":0.0,"stretch":false,"animationFPS":30.0,"animationSpeedType":0,"userdefinedAnimFPS":false,"visible":true,"depth":1900,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":true,"inheritVisibility":true,"inheritSubLayers":true,"gridX":16,"gridY":16,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
  ],
  "inheritLayers": true,
  "creationCodeFile": "",
  "inheritCode": false,
  "instanceCreationOrder": [
    {"name":"inst_7137AA2A","path":"rooms/rm_lobby/rm_lobby.yy",},
  ],
  "inheritCreationOrder": false,
  "sequenceId": null,
  "roomSettings": {
    "inheritRoomSettings": false,
    "Width": 6400,
    "Height": 6400,
    "persistent": false,
  },
  "viewSettings": {
    "inheritViewSettings": false,
    "enableViews": false,
    "clearViewBackground": false,
    "clearDisplayBuffer": true,
  },
  "physicsSettings": {
    "inheritPhysicsSettings": false,
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