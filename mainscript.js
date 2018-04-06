var oldWindowWidth = null;
var oldWindowHeight = null;

function randInt(max) {
  return Math.floor(Math.random() * Math.floor(max));
}

function loadedHTML(){
    changeButton();
    resizeBackground();
}

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

function resizeBackground(){
    var c=document.getElementById("background");
    c.width = window.outerWidth;
    c.height = window.outerHeight;
    var ctx=c.getContext("2d");
    ctx.fillStyle="rgb(0,0,0)";
    ctx.fillRect(0,0,window.outerWidth, window.outerHeight);
    oldWindowWidth = window.outerWidth;
    oldWindowHeight = window.outerHeight;
}

function onKey(){
    var c=document.getElementById("background");
    var ctx=c.getContext("2d");
    ctx.fillStyle="rgb(255,255,255)";
    var pixel = 10;
    ctx.fillRect(randInt(window.outerWidth/pixel)*pixel,randInt(window.outerHeight/pixel)*pixel,pixel,pixel);
}

window.onkeydown = onKey;

function onClick(event) {
    var c=document.getElementById("background");
    var ctx=c.getContext("2d");
    ctx.fillStyle="rgb(255,255,255)";
    var pixel = 10;
    var x = Math.floor(event.clientX/pixel)*pixel;
    var y = Math.floor(event.clientY/pixel)*pixel;
    ctx.fillRect(x, y,pixel,pixel);
}
