/// @description Create audio manager

global.volumeMaster = 1;
global.volumeSFX = 1;
global.volumeMusic = 1;
global.volumeEnvironment = 1;

enum VOL_TYPE {
	SFX,
	MUSIC,
	ENVIRONMENT
}

enum VOL_PRIORITY {
	LOWEST = 10,
	LOW = 20,
	NORMAL = 30,
	HIGH = 40,
	HIGHEST = 50,
}

//an array of structs to track the sounds playing.  Structs are created from addSound constructor
soundsPlaying = array_create(0);
//when a sound has stopped playing, remove it from the array.  Array should not have any empty values

playSound = function(_sound, _type, _priority = VOL_PRIORITY.NORMAL, _loop = false, _fadeIn = 0, _fadeOut = 0) {
	//_sound = sound asset to play
	//_type = SFX, MUSIC, or ENVIRONMENT.
	//_priority = LOWEST through HIGHEST from VOL_PRIORITY enum.  Can set a manual integer if desired.
	//_loop = loop the track if true
	//_fadeIn = time in milliseconds to fade in the volume
	//_fadeOut = time in milliseconds to fade out the volume
	
	//Check soundsPlaying array to see if we can play the sound.
	//If the same sound asset has been played on the same frame, skip playing the sound
	var _allowSoundToPlay = true;
	for(var i = 0; i < array_length(soundsPlaying); i++) {
		if(soundsPlaying[i].sound == _sound) {
			//Sound matches an existing sound.  Check if we can play it multiple times
			if(soundsPlaying[i].allowMultiple == false) {
				//If the sound asset is already playing, and we don't want multiple instances of this asset, don't play again
				_allowSoundToPlay = false;
			} 
			
			if (soundsPlaying[i].keepPlaying == false) {
				//We want to keep playing the sound
				soundsPlaying[i].keepPlaying = true;
			}
			
			//_allowSoundToPlay was created as true, we don't need to set true here
		}
		if(_allowSoundToPlay == false) {
		//Check to see if sound was stopping, but we want to start playing it again
			if(soundsPlaying[i].keepPlaying == true && soundsPlaying[i].isStopping == true) {
				soundsPlaying[i].isStopping = false; //Since we are no longer stopping the sound, we don't want to track sound as stopping
				audio_sound_gain(soundsPlaying[i].inst, 1, _fadeIn);
				
			}
		
		}
	}

	
	if(_allowSoundToPlay == true) {
		//Play the sound
		var _soundInst = audio_play_sound(_sound,_priority, _loop, 0);
		audio_sound_gain(_soundInst, 1, _fadeIn);	//Fade in to the fade in value provided
			
		
		
		var _soundStruct = new addSound(_soundInst, _sound, _priority, _type, _loop, _fadeIn, _fadeOut);
		addSoundToArray(_soundStruct);
	}
	
	//Set the volume level of all tracks
	
	//setSoundLevel();

}

setSoundLevel = function() {
	//WARN: This will overwrite any fading.  Only call on menu change
	var _volSfx = global.volumeMaster * global.volumeSFX;
	var _volMusic = global.volumeMaster * global.volumeMusic;
	var _volEnvrionment = global.volumeMaster * global.volumeEnvironment;
	
	for(var i = 0; i < array_length(soundsPlaying); i++) {
		switch(soundsPlaying[i].type) {
			case VOL_TYPE.SFX:
				audio_sound_gain(soundsPlaying[i].inst, _volSfx, 0);
			break;
			
			case VOL_TYPE.MUSIC:
				audio_sound_gain(soundsPlaying[i].inst, _volMusic, 0);
			break;
			
			case VOL_TYPE.ENVIRONMENT:
				audio_sound_gain(soundsPlaying[i].inst, _volEnvrionment, 0);
			break;
			
		}
	}
	
}



stopSound = function(_soundInst) {
	//Search through sound IDs first to see which one to stop.
	for(var i = 0; i < array_length(soundsPlaying); i++) {
		//Find the sound instance we want to stop
		var _inst = soundsPlaying[i].inst;
		var _sound = soundsPlaying[i].sound;
		var _isStopping = soundsPlaying[i].isStopping;
		
		//Check to see if given value is the sound instance or the sound name itself.
		if((_inst == _soundInst && _isStopping == false) || (_sound == _soundInst && _isStopping == false)) {
			var _fadeOut = soundsPlaying[i].fadeOut / 1000;//Divide period by 1000 to track milliseconds
			
			//Start fading out.  If there is no fadeout, it's instant.
			audio_sound_gain(soundsPlaying[i].inst, 0, soundsPlaying[i].fadeOut);
			soundsPlaying[i].isStopping = true;
			var _soundHandle = time_source_create(time_source_game, _fadeOut, time_source_units_seconds, removeSound,[_soundInst]);
			time_source_start(_soundHandle);
			//removeSound(soundsPlaying[i].inst);
			//var _handle = call_later(_fadeOut, time_source_units_seconds, removeSound(_soundInst), false); 
			//var _handle = call_later(0, time_source_units_seconds, audio_get_name(_soundInst), false); 
			//return; //This return will end the function, skipping the for loop below since we have already found the sound we want to stop
			break;
		}
	}	
}


#region Methods only used by AudioMan, do not call
stepEnd = function() {
	//Go through array and flip the justStarted flag from true to false so the same sound can be played next frame if desired
	for(var i = 0; i < array_length(soundsPlaying); i++) {
		//Check if the sound is a looping sound.  If it is looping, we don't want multiple
		if(soundsPlaying[i].loop == true) {
			//Do not allow multiple, so we leave it alone
			//We do not set to false as it's created with false and if something else sets it we don't
			//want to override it
			
			//We want to check if the sound has been played again this step, if so keep it going
			//Otherwise, stop the stound
			if(soundsPlaying[i].keepPlaying == false) {
				stopSound(soundsPlaying[i].inst);
				//i--;
				//break; //stopSound removes the sound from the array, so we need to -1 to i and start for loop over
			} else {
				//Set to false so if we do not play the sound again next frame, we will stop the sound.
				soundsPlaying[i].keepPlaying = false;	
			}
			
		}
		else if(soundsPlaying[i].allowMultiple == false) {
			//Allow multiple sounds to start playing
			soundsPlaying[i].allowMultiple = true;
			
		}
		
		//Check if the audio is done, if so, clean it up
		//if(!audio_is_playing(soundsPlaying[i].inst)){
			//stopSound(soundsPlaying[i].inst);
			//i--;
			//break;
		//}
		
	}
	
}
addSoundToArray = function(_soundStruct) {
	
	array_push(soundsPlaying, _soundStruct);
}
removeSound = function (_soundInst) {
	for(var i = 0; i < array_length(soundsPlaying); i++) {
		//Find the sound instance we want to stop
		if(soundsPlaying[i].inst == _soundInst) {
			if(soundsPlaying[i].isStopping == true) {
				//Check if we still actually want to stop.
				audio_stop_sound(_soundInst);
				array_delete(soundsPlaying, i , 1);				
			}
			
		}
	}

}