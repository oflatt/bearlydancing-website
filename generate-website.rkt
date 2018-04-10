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
          )))))))
 index-file-port)

(close-output-port index-file-port)
