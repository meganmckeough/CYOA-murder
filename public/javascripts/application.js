var stormButton = document.querySelector('.storm');
var audio = document.querySelector('audio');

function toggleAudio () {
	if (stormButton.textContent === 'pause the storm') {
		audio.pause();
		stormButton.textContent = 'start the storm';	
	} else if (stormButton.textContent === 'start the storm') {
		audio.play();
		stormButton.textContent = 'pause the storm';
	}
}

stormButton.addEventListener('click', toggleAudio);

