
function changeButton() {
    var button = document.getElementById('download-button');
    // by default set it to the windows link
    // otherwise set it to the mac link
    if (navigator.appVersion.indexOf("Mac")!=-1) {
	button.setAttribute('onclick', "window.location.href='https://github.com/oflatt/bearlydancing/raw/master/src/pics/honeyback1.png'");
	button.innerHTML = "Download (Mac)";
    } else {
	button.setAttribute('onclick', "window.location.href='https://github.com/oflatt/bearlydancing/raw/master/src/pics/honeyback3.png'");
	button.innerHTML = "Download (Windows)";
    }
}
