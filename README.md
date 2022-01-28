# hspreludequiz

This is a code for some kind of webapp thing for Haskell skills

Wut:
The first version of this thing is a quiz that you can use to quiz your skills for half of the words from Haskell prelude.  Warning!! This quiz might expect you to know things like which erroring functions cause which error messages.  This quiz might be a total jerk in that sense.

How to run this (easy):
Open the following link in a web browser and hopefully you'll get the current version of this thing playing in a web browser, but that's running on my website, not running on this github code, but it should be equivalent.
jmegasystems.com/pages/preludequiz/preludetest01.html

How to run this (actually):
clone this repository on to your computer.  Then open deck1amaker.hs in GHCi, type in "go" or "main".  It should generate deck_ntf3_1a.js.  Do the same thing for deck1bmaker.hs and deck1cmaker.hs and deck1dmaker.hs and then you'll have deck_ntf3_1b.js and deck_ntf3_1c.js and deck_ntf3_1d.js.  Then you should have everything that the quiz needs in order to run.  Then load up preludetest01.html in a web browser and hopefully you have a quiz thing that will test how well you know half of the Haskell prelude.  Press the buttons on screen to change the color scheme, or which decks you're using.  Subdeck 1-all is for 100-something of the 200-something functions of prelude.  1A and 1B and 1C and 1D are that 100-something broken into quarters.
