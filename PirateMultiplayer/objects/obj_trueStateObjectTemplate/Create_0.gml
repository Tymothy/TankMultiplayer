/// @desc Initialize State Machine and properties
useAi = true;

//Initaite truestate
behavior = use_truestate();
behavior.addState(State.stand, st_player_stand, "Stand");
behavior.addState(State.fall, st_player_fall, "Fall");
behavior.addState(State.land, st_player_land, "Land");
behavior.addState(State.run, st_player_run, "Run");
behavior.addState(State.jump, st_player_jump, "Jump");
behavior.addState(State.doubleJump, st_player_double_jump, "Double Jump");
behavior.addState(State.attackA, st_player_attacka, "Attack A");
behavior.addState(State.attackB, st_player_attackb, "Attack B");
behavior.addState(State.attackC, st_player_attackc, "Attack C");
behavior.addState(State.airAttackA, st_player_air_attacka, "Air Attack A");
behavior.addState(State.airAttackB, st_player_air_attackb, "Air Attack B");
behavior.addState(State.airAttackC, st_player_air_attackc, "Air Attack C");
behavior.addState(State.slide, st_player_slide, "Slide");
behavior.addState(State.dash, st_player_slide_dash, "Slide Dash");
behavior.addState(State.wallSlide, st_player_wall_slide, "Wall Slide");
behavior.addState(State.wallKick, st_player_wall_kick, "Wall Kick");

decision = use_truestate(st_player_ai_idle);


//Movement Properties
hspd = 0;
move_max_speed = 3;
move_friction = .1;
move_accel = move_friction * 2;

vspd = 0;
jump_power = 3.3;
double_jump_available = true;
gravity_inc = .1;
gravity_max = 10;
grace_frames = 0;
max_grace_frames = 8;

face_direction = 1; //1 right, -1 left.
against_wall = [0,0];

zero_controls();