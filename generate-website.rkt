#lang racket
(require html-writing html-parsing)

(define index-file-port (open-output-file "index.html" #:exists 'replace))

(write-html
 `((html
    (head
     (title "bearly dancing- demo")
     (script (@ (src "mainscript.js")))
     (link (@ (rel "stylesheet")
              (type "text/css")
              (href "style.css"))))
    (body
     (@ (onload "loadedHTML()")
        (onresize "resizeBackground()")
        (onclick "onClick(event)")
        (style "background-color:black"))
     (canvas
      (@ (id "background")
         (style "position:fixed; top:0;left:0")
         (width "900")
         (height "900")))
     (center
      (div
       (@ (z-score "1")
          (style "display: inline-block;position:relative"))
       (center
        (h1
         "bearly dancing")
        (div
         (@ (style "margin-bottom:20"))
         (iframe
          (@ (width "950")
             (height "540")
             (frameborder "0")
             (allowfullscreen)
             (src "https://www.youtube.com/embed/g6SlOlGsGdE?rel=0&autoplay=1&mute=1&amp&loop=1&playlist=g6SlOlGsGdE;showinfo=0&amp"))))
        (button
         (@
          (id "download-button")
          (style "height:60px;width:270px;background-color:black;outline-color:white")
          (onmouseover "changeToGrey(this)")
          (onmouseleave "changeToBlack(this)")
          (onclick "window.location.href='https://github.com/oflatt/bearlydancing/raw/master/src/pics/honeyback0.png'"))
         "Download")
        (div
         (@ (width "950")
            (style  "text-indent:2px;width:920;overflow:auto;text-align:justify"))
         (h1
          "Please send feedback to oflatt@gmail.com so that I can make the game better.")
         (center
          (h1 "FAQ"))
         (h1 (@ (style "margin-bottom:10")) "How do I run the game?")
         (h1 "-After downloading, un-zip the files. Run the bearly dancing executable in the folder. Note that it relies on all the files in the folder, so do not remove it from the folder.")
         (h1 (@ (style "margin-bottom: 10")) "The game won't run because it is not trusted. What do I do?")
         (h1 "-On Windows, just double click the executable and hit 'run' in the popup menu. On Mac, right click the application and hit 'open'. Then you can hit a drop-down menu and choose run anyways from there.")
         (h1 (@ (style "margin-bottom:10")) "The download is getting stuck or getting erased. What do I do?")
         (h1 "-This is typically a problem on Windows. Because I am an 'unidentified developer', windows does not trust the game. First, try hitting the drop down menu on the downloaded file in your browser and look for 'download anyways' or 'keep' button. Second, if the file is getting erased by Windows Defender and you get a little notification, then you will have to disable Windows Defender in order to play it. (Windows Defender is like airport security- it's annoying and doesn't stop much.)")
         (h1 (@ (style "margin-bottom:10")) "Is the art and music the game original?")
         (h1 "-Yes. I composed the music for the game, and my sister Sophia did much of the pixel art.")
         (h1)
         (center
          (h1 "a game by Oliver Flatt- contact and report bugs at oflatt@gmail.com")))))))))
 index-file-port)

(close-output-port index-file-port)
