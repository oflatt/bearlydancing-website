#lang racket
(require html-writing html-parsing)

(define index-file-port (open-output-file "index.html" #:exists 'replace))

(write-html
 `((html
    (head
     (title "bearly dancing")
     (script (@ (src "mainscript.js")))
     (link (@ (rel "stylesheet")
              (type "text/css")
              (href "style.css"))))
    (body
     (@ (onload "loadedHTML()")
        (onresize "resizeBackground()")
        (onclick "onClick(event)"))
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
        (button
         (@
          (id "download-button")
          (style "height:60px;width:270px;background-color:black;outline-color:white")
          (onmouseover "changeToGrey(this)")
          (onmouseleave "changeToBlack(this)")
          (onclick "window.location.href='https://github.com/oflatt/bearlydancing/raw/master/src/pics/honeyback0.png'"))
         "test button")))))))
 index-file-port)

(close-output-port index-file-port)
