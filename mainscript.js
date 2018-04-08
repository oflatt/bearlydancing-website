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
