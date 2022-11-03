var audio = document.getElementById("audio");

function togglePlay() {
    return (audio.currentTime == 0 || audio.paused) ? audio.play() : audio.pause();
}