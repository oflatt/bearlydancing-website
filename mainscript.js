var oldWindowWidth = null;
var oldWindowHeight = null;
var pixel = 10;

function randInt(max) {
  return Math.floor(Math.random() * Math.floor(max));
}

var brightcolor = randInt(3);
var variedcolor = randInt(2);
if(brightcolor == variedcolor){
    variedcolor = 2;
}

function loadedHTML(){
    changeButton();
    resizeBackground();
}


var windowsdownload = "https://github.com/oflatt/bearlydancing/releases/download/v0.0-demo/bearly.dancing.demo.windows.zip"
var macdownload = "https://github.com/oflatt/bearlydancing/releases/download/v0.0-demo/bearly.dancing.demo.mac.zip"

var windowsdownloaddropbox = "https://www.dropbox.com/s/438zixtpv3lo5ta/bearly%20dancing%20demo%20windows.zip?dl=1"
var macdownloaddropbox = "https://www.dropbox.com/s/t9lmm04w1fprmsz/bearly%20dancing%20demo%20mac.zip?dl=1"

var altwindowsdownload = "https://drive.google.com/uc?export=download&id=1Qa63C8hCYqrFE5oXy7S0TgsHzots-xF3"
var altmacdownload = "https://drive.google.com/uc?export=download&id=1u51RW-FxJ7hq0aAaeAhs0VaJhFZf00RM"

function changeButton() {
    var macdownloadlink = document.getElementById('macdownload');
    macdownloadlink.setAttribute('href', altmacdownload);

    var windowsdownloadlink = document.getElementById('windowsdownload');
    windowsdownloadlink.setAttribute('href', altwindowsdownload);

    var button = document.getElementById('download-button');
    // by default set it to the windows link
    // otherwise set it to the mac link
    if (navigator.appVersion.indexOf("Mac")!=-1) {
	button.setAttribute('onclick', "window.location.href='" + macdownload + "'");
	button.innerHTML = "Download (Mac)";
    } else {
	button.setAttribute('onclick', "window.location.href='" + windowsdownload + "'");
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

function fillpixel(xpos, ypos){
    var rgb = [0,0,0];
    rgb[brightcolor] = 255;
    var xfactor = Math.round((Math.abs((xpos+pixel/2)-(window.outerWidth/2))/(window.outerWidth/2)) * (255/2));
    var yfactor = Math.round((Math.abs((ypos+pixel/2)-(window.outerHeight/2))/(window.outerHeight/2)) * (255/2));
    rgb[variedcolor] = xfactor + yfactor;
    
    var c=document.getElementById("background");
    var ctx=c.getContext("2d");
    ctx.fillStyle="rgb("+rgb[0].toString()+","+rgb[1].toString()+","+rgb[2].toString()+")";
    ctx.fillRect(xpos, ypos, pixel, pixel);
}

function onKey(){
    fillpixel(randInt(window.outerWidth/pixel)*pixel,randInt(window.outerHeight/pixel)*pixel);
}

window.onkeydown = onKey;

function onClick(event) {
    var x = Math.floor(event.clientX/pixel)*pixel;
    var y = Math.floor(event.clientY/pixel)*pixel;
    fillpixel(x,y);
}

function changeToGrey(obj){
    obj.style.backgroundColor = "rgb(20,20,20)";
}

function changeToBlack(obj){
    obj.style.backgroundColor = "rgb(0,0,0)";
}
