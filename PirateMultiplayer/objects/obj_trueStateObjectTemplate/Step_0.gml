/// @desc State step
if(useAi){
  zero_controls();
	decision.event(TrueStateEvent.onStep)
}
else
  read_controls();

//You can do other things in your step event if you 
//want, but you sorta need this:
behavior.event(TrueStateEvent.onStep);