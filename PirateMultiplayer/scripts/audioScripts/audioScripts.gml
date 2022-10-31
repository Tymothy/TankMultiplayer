/*
function <NAME>(_var1, _var2, _var3...) {

//CODE
}
*/
function addSound(_soundInst, _sound, _priority, _type, _loop, _fadeIn, _fadeOut) constructor{
	/// @desc Creates the a struct to track all the data about the sound being played

	inst = _soundInst; //Instance ID of the sound being played
	sound = _sound; //The sound asset being played
	priority = _priority; //Priority of the sound being played
	type = _type; //Type of sound, VOL_TYPE enum
	loop = _loop; //Whether to loop the sound or not
	fadeIn = _fadeIn; //Whether to fade the sound in when being played
	fadeOut = _fadeOut; //Whether to fade the sound out when not being played
	
	//Variables below are used by the audio engine and not set by other objects	
	allowMultiple = false; //Whether or not multiple sounds of the sound asset are allowed to exist
	keepPlaying = true; //Used to track when a looped sound has stopped being played
	isStopping = false; //Used to track when a sound with fade out is stopping
}

function audioMan_play_sfx(_sound, _loop = false, _fadeIn = 0, _fadeOut = 0) {
	/// @desc Play sfx
	/// @arg sound
	/// @arg loop[optional]
	/// @arg fadeIn[optional]
	/// @arg fadeOut[optional]
	co_audioManager.playSound(_sound, VOL_TYPE.SFX, VOL_PRIORITY.HIGH, _loop, _fadeIn, _fadeOut);
}

function audioMan_play_music(_sound, _loop = false, _fadeIn = 1000, _fadeOut = 0, _crossfade = true) {
	/// @desc Play music
	/// @arg sound
	/// @arg loop[optional]
	/// @arg fadeIn[optional]
	/// @arg fadeOut[optional]	
	/// @arg crossfade[optional]
	co_audioManager.playSound(_sound, VOL_TYPE.MUSIC, VOL_PRIORITY.LOW, _loop, _fadeIn, _fadeOut);
	//TODO: Unfinished function
}