#lang racket
(require html-writing html-parsing)

(define index-file-port (open-output-file "index.html" #:exists 'replace))

(write-html
 `((html
    (head
     ,(html->xexp "<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src='https://www.googletagmanager.com/gtag/js?id=UA-117353772-1'></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-117353772-1');
</script>")
     (title "bearly dancing")
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
        (h2
         "bearly dancing- demo")
        (div
         (@ (style "margin-bottom:20"))
         (iframe
          (@ (width "950")
             (height "540")
             (frameborder "0")
             (allowfullscreen)
             (src "https://www.youtube.com/embed/g6SlOlGsGdE?rel=0&autoplay=1&mute=1&amp&loop=1&controls=0&playlist=g6SlOlGsGdE;showinfo=0&amp"))))
        (button
         (@
          (id "download-button")
          (style "height:60px;width:270px;background-color:black;outline-color:white")
          (onmouseover "changeToGrey(this)")
          (onmouseleave "changeToBlack(this)")
          (onclick "window.location.href='https://github.com/oflatt/bearlydancing/raw/master/src/pics/honeyback0.png'"))
         "Please wait...")
        (div
         (@ (width "950")
            (style  "width:950;overflow:auto;text-align:justify"))
         (h2
          "Thank you for visiting! Please send feedback and bug reports to oflatt@gmail.com so that I can make the game better. If you cannot get the game to run, please read the section below to fix the problem, or contact me if it doesn't.")
         (center
          (h2 "Troubleshooting"))
         (faq "The download is getting stuck or is getting erased. What do I do?")
         (h1 "-First, try hitting the drop down menu on the downloaded file in your browser and look for a 'download anyways' or 'keep' button and hit it. Second, if the file is getting erased by Windows Defender, then you will have to disable Windows Defender in settings in order to play it. It will really try to stop you from disabling it, but it's okay. (Windows Defender is like airport security- it's annoying and doesn't stop much.)")
         (faq "I downloaded... what now?")
         (h1 "-After downloading, extract the files. On Mac simply double click the downloaded file, and on Windows drag the folder out after double clicking. Then double click the bearly dancing executable in the newly created folder. On Windows, note that the game relies on all the files in the folder, so do not remove it. On Mac, the bear doesn't like to stay in the same folder, so on newer versions of the OS you will have to move the .app file out of the folder before running it. (This is because of sandboxing, the OS not trusting it again.)")
         (faq "The game won't run because it is not trusted. What do I do?")
         (h1 "-On Windows, double click the executable and hit 'run' in the popup menu. On Mac, right click the application and click 'open'. The menu will then allow you to open anyways. If that does not work, going into security settings and allowing it to run should.")
         (faq "I am on a Mac and the game crashes upon opening. What do I do?")
         (h1 "-Try moving the game file (the .app) out of the folder. This problem comes up with newer versions of Mac that sandbox the game. You can move it back into the folder after, you just have to move it to tell the OS that you trust it. If this doesn't work, please contact me.")
         (faq "Windowed mode isn't working well and command tab does not work on the Mac. What do I do?")
         (h1 "Sorry, nothing for now. I'm working on those. Fullscreen mode should work and you can save and exit the game at literally any time during the game using the escape key.")
         (faq "The game is too difficult and I can't win. What do I do?")
         (h1 "Git good or grind. Just kidding, just tell me about it. This game isn't balanced very well as of yet, and I appreciate the input. I can hack you up something good, or you can do it yourself!")
         
         
         (center
          (h2 "FAQ"))
         (faq "Is the art and music the game original?")
         (h1 "-Yes. I composed the music for the game, and my sister Sophia did much of the pixel art.")
         (h1)
         (faq "When is the full game going to be on Steam?")
         (h1 "-Hopefully, in about the summer of 2019.")
         (faq "Can I have the source code?")
         (h1 (span "Absolutely! bearly dancing is open source. You can visit ")
             (span (a (@ (href "https://github.com/oflatt/bearlydancing")) "https://github.com/oflatt/bearlydancing"))
             (span " to get it. I encourage messing around with it. Just don't sell it, it has a license on it."))
         (faq "Why the dots in the background?")
         (h1 (span "Just for fun. If you want something more interesting, check out ")
             (span (a (@ (href "http://oflatt.com/predetermined.html")) "http://oflatt.com/predetermined.html"))
             (span "."))
         (faq "How do I time a perfect note in game?")
         (h1 "Have a background in classical music. Just kidding, mostly. Listen to the beat and time the both the press and release. The bars will overlap at the correct time. Unlike many other rhythm games, this one tests your ability to hold the note to the correct duration.")
        
         (faq "What if I want alternate download links?")
         (h1
          (a (@ (href "linktobereplaced")
                (id "macdownload"))
             "Mac alternate download"))
         (h1
          (a (@ (href "linktobereplaced")
                (id "windowsdownload"))
             "Windows alternate download"))
         
         (center
          (img (@ (src "https://github.com/oflatt/portfolio-gifs/raw/master/beardance.gif")))
          (h1 "a game by Oliver Flatt- contact and report bugs at oflatt@gmail.com")))))))))
 index-file-port)

(close-output-port index-file-port)
