import Deckmakerhelpers
import Data.List(intercalate)

-- go = main because I like to be able to open the .hs file and then type "go" to make it do the thing.
go = main

subdeck01aminextlist = [ minextmakernunutomh compare x x | x <- [0, 2, 3, 4, 5, 6, 8, 9]]
subdeck01bminextlist = [ minextmakernunutomh compare x y | x <- [0, 4, 7, 9], y <- [1, 3, 6, 8]]
subdeck01cminextlist = [ minextmakerchchtomh compare x x | x <- "ahlmquwx"]
subdeck01dminextlist = [ minextmakerchchtomh compare x y | x <- "furm", y <- "otpe"]
subdeck01minextlist = concat [subdeck01aminextlist, subdeck01bminextlist, subdeck01cminextlist, subdeck01dminextlist]

subdeck02aminextlist = [ concat [termopen1, openparenwithcolor, shownumwithcolor x, space, fourdotwithcolor, space, htmlcolor2 "Int", closeparenwithcolor, space, fourdotwithcolor, space, htmlcolor2 "Float", newline, shownumwithcolor ((fromIntegral x) :: Float), newline, termopen1, openparenwithcolor, shownumwithcolor x, space, fourdotwithcolor, space, htmlcolor2 "Integer", closeparenwithcolor, space, fourdotwithcolor, space, htmlcolor2 "Float", newline, shownumwithcolor ((fromIntegral x) :: Float), newline, prelprompt] | x <- [0..9] ]
subdeck02bminextlist = [ concat [termopen1, openparenwithcolor, shownumwithcolor x, space, fourdotwithcolor, space, htmlcolor2 "Int", closeparenwithcolor, space, fourdotwithcolor, space, htmlcolor2 "Double", newline, shownumwithcolor ((fromIntegral x) :: Double), newline, termopen1, openparenwithcolor, shownumwithcolor x, space, fourdotwithcolor, space, htmlcolor2 "Integer", closeparenwithcolor, space, fourdotwithcolor, space, htmlcolor2 "Double", newline, shownumwithcolor ((fromIntegral x) :: Double), newline, prelprompt] | x <- [0..9] ]
subdeck02cminextlist = [ concat [termopen1, openparenwithcolor, shownumwithcolor x, space, fourdotwithcolor, space, htmlcolor2 "Integer", closeparenwithcolor, space, fourdotwithcolor, space, htmlcolor2 "Float", newline, shownumwithcolor ((fromIntegral x) :: Float), newline, termopen1, openparenwithcolor, shownumwithcolor x, space, fourdotwithcolor, space, htmlcolor2 "Int", closeparenwithcolor, space, fourdotwithcolor, space, htmlcolor2 "Float", newline, shownumwithcolor ((fromIntegral x) :: Float), newline, prelprompt] | x <- [0..9] ]
subdeck02dminextlist = [ concat [termopen1, openparenwithcolor, shownumwithcolor x, space, fourdotwithcolor, space, htmlcolor2 "Integer", closeparenwithcolor, space, fourdotwithcolor, space, htmlcolor2 "Double", newline, shownumwithcolor ((fromIntegral x) :: Double), newline, termopen1, openparenwithcolor, shownumwithcolor x, space, fourdotwithcolor, space, htmlcolor2 "Int", closeparenwithcolor, space, fourdotwithcolor, space, htmlcolor2 "Double", newline, shownumwithcolor ((fromIntegral x) :: Double), newline, prelprompt] | x <- [0..9] ]
subdeck02minextlist = concat [subdeck02aminextlist, subdeck02bminextlist, subdeck02cminextlist, subdeck02dminextlist]

subdeck03aminextlist = [ concat [termopen1, openparenwithcolor, shownumwithcolor x, space, fourdotwithcolor, space, htmlcolor2 "Integer", closeparenwithcolor, space, fourdotwithcolor, space, htmlcolor2 "Float", newline, shownumwithcolor ((fromIntegral x) :: Float), newline, termopen1, openparenwithcolor, shownumwithcolor x, space, fourdotwithcolor, space, htmlcolor2 "Int", closeparenwithcolor, space, fourdotwithcolor, space, htmlcolor2 "Float", newline, showghcitextwithcolor (errorstring x), newline, prelprompt] | x <- [0..9] ]
   where errorstring x = concat ["&lt;interactive&gt;:2:14: error:&nbsp&nbsp&nbsp&nbsp* Couldn't match expected type `Integer' with actual type `Int'<br>&nbsp&nbsp&nbsp&nbsp* In the first argument of `fromInteger', namely `(", show x, " :: Int)'<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbspIn the expression: fromInteger (", show x, " :: Int) :: Float<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbspIn an equation for `it': it = fromInteger (", show x, " :: Int) :: Float"]
subdeck03bminextlist = [ concat [termopen1, openparenwithcolor, shownumwithcolor x, space, fourdotwithcolor, space, htmlcolor2 "Integer", closeparenwithcolor, space, fourdotwithcolor, space, htmlcolor2 "Double", newline, shownumwithcolor ((fromIntegral x) :: Double), newline, termopen1, openparenwithcolor, shownumwithcolor x, space, fourdotwithcolor, space, htmlcolor2 "Int", closeparenwithcolor, space, fourdotwithcolor, space, htmlcolor2 "Double", newline, showghcitextwithcolor (errorstring x), newline, prelprompt] | x <- [0..9] ]
   where errorstring x = concat ["&lt;interactive&gt;:2:14: error:&nbsp&nbsp&nbsp&nbsp* Couldn't match expected type `Integer' with actual type `Int'<br>&nbsp&nbsp&nbsp&nbsp* In the first argument of `fromInteger', namely `(", show x, " :: Int)'<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbspIn the expression: fromInteger (", show x, " :: Int) :: Double<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbspIn an equation for `it': it = fromInteger (", show x, " :: Int) :: Double"]
subdeck03cminextlist = [ concat [termopen1, openparenwithcolor, shownumwithcolor x, space, fourdotwithcolor, space, htmlcolor2 "Int", closeparenwithcolor, space, fourdotwithcolor, space, htmlcolor2 "Float", newline, showghcitextwithcolor (errorstring x), newline, termopen1, openparenwithcolor, shownumwithcolor x, space, fourdotwithcolor, space, htmlcolor2 "Integer", closeparenwithcolor, space, fourdotwithcolor, space, htmlcolor2 "Float", newline, shownumwithcolor ((fromIntegral x) :: Float), newline, prelprompt] | x <- [0..9] ]
   where errorstring x = concat ["&lt;interactive&gt;:1:14: error:&nbsp&nbsp&nbsp&nbsp* Couldn't match expected type `Integer' with actual type `Int'<br>&nbsp&nbsp&nbsp&nbsp* In the first argument of `fromInteger', namely `(", show x, " :: Int)'<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbspIn the expression: fromInteger (", show x, " :: Int) :: Float<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbspIn an equation for `it': it = fromInteger (", show x, " :: Int) :: Float"]
subdeck03dminextlist = [ concat [termopen1, openparenwithcolor, shownumwithcolor x, space, fourdotwithcolor, space, htmlcolor2 "Int", closeparenwithcolor, space, fourdotwithcolor, space, htmlcolor2 "Double", newline, showghcitextwithcolor (errorstring x), newline, termopen1, openparenwithcolor, shownumwithcolor x, space, fourdotwithcolor, space, htmlcolor2 "Integer", closeparenwithcolor, space, fourdotwithcolor, space, htmlcolor2 "Double", newline, shownumwithcolor ((fromIntegral x) :: Double), newline, prelprompt] | x <- [0..9] ]
   where errorstring x = concat ["&lt;interactive&gt;:1:14: error:&nbsp&nbsp&nbsp&nbsp* Couldn't match expected type `Integer' with actual type `Int'<br>&nbsp&nbsp&nbsp&nbsp* In the first argument of `fromInteger', namely `(", show x, " :: Int)'<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbspIn the expression: fromInteger (", show x, " :: Int) :: Double<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbspIn an equation for `it': it = fromInteger (", show x, " :: Int) :: Double"]
subdeck03minextlist = concat [subdeck03aminextlist, subdeck03bminextlist, subdeck03cminextlist, subdeck03dminextlist]

divmodpairs = [(14, 3), (17, 3), (20, 3), (11, 4), (23, 4), (27, 4), (13, 5), (14, 5), (17, 5), (19, 5), (22, 5), (23, 5), (32, 5), (33, 5), (34, 5), (37, 5), (38, 5), (39, 5), (17, 6), (22, 6), (23, 6), (17, 7), (18, 7), (19, 7), (20, 7)]

subdeck04minextlist = [ minextmakernunutonu div x y | (x, y) <- divmodpairs ]

subdeck05minextlist = [ minextmakernunutonu mod x y | (x, y) <- divmodpairs ]

subdeck06minextlist = [ minextmakernunutonu divMod x y | (x, y) <- divmodpairs ]

subdeck08aminextlist = [ concat [termopen1, space, showgthannumwithcolors x, space, showrangewithcolors y u, newline, showmischswithcolor (any (>x) [y..u]), newline, termopen1, space, showgthannumwithcolors z, space, showrangewithcolors y u, newline, showmischswithcolor (any (>z) [y..u]), newline, termopen1, space, showgthannumwithcolors v, space, showrangewithcolors y u, newline, showmischswithcolor (any (>v) [y..u]), newline, prelprompt] | x <- [0,1], y <- [2], z <- [4, 5], u <- [6, 7], v <- [8] ]
subdeck08bminextlist = [ concat [termopen1, space, showlthannumwithcolors x, space, showrangewithcolors y u, newline, showmischswithcolor (any (<x) [y..u]), newline, termopen1, space, showlthannumwithcolors z, space, showrangewithcolors y u, newline, showmischswithcolor (any (<z) [y..u]), newline, termopen1, space, showlthannumwithcolors v, space, showrangewithcolors y u, newline, showmischswithcolor (any (<v) [y..u]), newline, prelprompt] | x <- [1], y <- [2, 3], z <- [4, 5], u <- [7], v <- [8, 9] ]
subdeck08cminextlist = [ concat [termopen1, space, showgthannumwithcolors v, space, showrangewithcolors y u, newline, showmischswithcolor (any (>v) [y..u]), newline, termopen1, space, showgthannumwithcolors z, space, showrangewithcolors y u, newline, showmischswithcolor (any (>z) [y..u]), newline, termopen1, space, showgthannumwithcolors x, space, showrangewithcolors y u, newline, showmischswithcolor (any (>x) [y..u]), newline, prelprompt] | x <- [0,1], y <- [3], z <- [4, 5], u <- [6, 7], v <- [8, 9] ]
subdeck08dminextlist = [ concat [termopen1, space, showlthannumwithcolors v, space, showrangewithcolors y u, newline, showmischswithcolor (any (<v) [y..u]), newline, termopen1, space, showlthannumwithcolors z, space, showrangewithcolors y u, newline, showmischswithcolor (any (<z) [y..u]), newline, termopen1, space, showlthannumwithcolors x, space, showrangewithcolors y u, newline, showmischswithcolor (any (<x) [y..u]), newline, prelprompt] | x <- [0,1], y <- [2, 3], z <- [4, 5], u <- [6], v <- [8, 9] ]
subdeck08minextlist = concat [subdeck08aminextlist, subdeck08bminextlist, subdeck08cminextlist, subdeck08dminextlist]

subdeck09aminextlist = [ concat [termopen1, space, showgthannumwithcolors x, space, showrangewithcolors y u, newline, showmischswithcolor (all (>x) [y..u]), newline, termopen1, space, showgthannumwithcolors z, space, showrangewithcolors y u, newline, showmischswithcolor (all (>z) [y..u]), newline, termopen1, space, showgthannumwithcolors v, space, showrangewithcolors y u, newline, showmischswithcolor (all (>v) [y..u]), newline, prelprompt] | x <- [0,1], y <- [2], z <- [4, 5], u <- [6, 7], v <- [8] ]
subdeck09bminextlist = [ concat [termopen1, space, showlthannumwithcolors x, space, showrangewithcolors y u, newline, showmischswithcolor (all (<x) [y..u]), newline, termopen1, space, showlthannumwithcolors z, space, showrangewithcolors y u, newline, showmischswithcolor (all (<z) [y..u]), newline, termopen1, space, showlthannumwithcolors v, space, showrangewithcolors y u, newline, showmischswithcolor (all (<v) [y..u]), newline, prelprompt] | x <- [1], y <- [2, 3], z <- [4, 5], u <- [7], v <- [8, 9] ]
subdeck09cminextlist = [ concat [termopen1, space, showgthannumwithcolors v, space, showrangewithcolors y u, newline, showmischswithcolor (all (>v) [y..u]), newline, termopen1, space, showgthannumwithcolors z, space, showrangewithcolors y u, newline, showmischswithcolor (all (>z) [y..u]), newline, termopen1, space, showgthannumwithcolors x, space, showrangewithcolors y u, newline, showmischswithcolor (all (>x) [y..u]), newline, prelprompt] | x <- [0,1], y <- [3], z <- [4, 5], u <- [6, 7], v <- [8, 9] ]
subdeck09dminextlist = [ concat [termopen1, space, showlthannumwithcolors v, space, showrangewithcolors y u, newline, showmischswithcolor (all (<v) [y..u]), newline, termopen1, space, showlthannumwithcolors z, space, showrangewithcolors y u, newline, showmischswithcolor (all (<z) [y..u]), newline, termopen1, space, showlthannumwithcolors x, space, showrangewithcolors y u, newline, showmischswithcolor (all (<x) [y..u]), newline, prelprompt] | x <- [0,1], y <- [2, 3], z <- [4, 5], u <- [6], v <- [8, 9] ]
subdeck09minextlist = concat [subdeck09aminextlist, subdeck09bminextlist, subdeck09cminextlist, subdeck09dminextlist]

subdeck10aminextlist = [ let foo = x + y in minextmakerfnnltonl takeWhile (< foo) (showlthannumwithcolors foo) (concat $ replicate 2 [y..(y + z)]) | x <- [2, 3], y <- [1, 2, 3], z <- [5, 6] ]
subdeck10bminextlist = [ let foo = y - x in minextmakerfnnltonl takeWhile (> foo) (showgthannumwithcolors foo) (concat $ replicate 2 [y, (pred y)..(y - z)]) | x <- [2, 3], y <- [9, 8, 7], z <- [5, 6] ]
subdeck10cminextlist = [ let foo = succn x y in minextmakerfnsttost takeWhile (< foo) (showlthancharwithcolors foo) (concat $ replicate 2 [y..(succn z y)]) | x <- [2, 3], y <- "ajr", z <- [5, 6] ]
subdeck10dminextlist = [ let foo = predn x y in minextmakerfnsttost takeWhile (> foo) (showgthancharwithcolors foo) (concat $ replicate 2 [y, (pred y)..(predn z y)]) | x <- [2, 3], y <- "zng", z <- [5, 6] ]
subdeck10minextlist = concat [subdeck10aminextlist, subdeck10bminextlist, subdeck10cminextlist, subdeck10dminextlist]

subdeck11aminextlist = [ let foo = x + y in minextmakerfnnltonl dropWhile (< foo) (showlthannumwithcolors foo) (concat $ replicate 2 [y..(y + z)]) | x <- [2, 3], y <- [1, 2, 3], z <- [5, 6] ]
subdeck11bminextlist = [ let foo = y - x in minextmakerfnnltonl dropWhile (> foo) (showgthannumwithcolors foo) (concat $ replicate 2 [y, (pred y)..(y - z)]) | x <- [2, 3], y <- [9, 8, 7], z <- [5, 6] ]
subdeck11cminextlist = [ let foo = succn x y in minextmakerfnsttost dropWhile (< foo) (showlthancharwithcolors foo) (concat $ replicate 2 [y..(succn z y)]) | x <- [2, 3], y <- "ajr", z <- [5, 6] ]
subdeck11dminextlist = [ let foo = predn x y in minextmakerfnsttost dropWhile (> foo) (showgthancharwithcolors foo) (concat $ replicate 2 [y, (pred y)..(predn z y)]) | x <- [2, 3], y <- "zng", z <- [5, 6] ]
subdeck11minextlist = concat [subdeck11aminextlist, subdeck11bminextlist, subdeck11cminextlist, subdeck11dminextlist]

subdeck12aminextlist = [ let foo = x + y in minextmakerfnnltop3 span (< foo) (showlthannumwithcolors foo) (concat $ replicate 2 [y..(y + z)]) | x <- [2, 3], y <- [1, 2, 3], z <- [5, 6] ]
subdeck12bminextlist = [ let foo = y - x in minextmakerfnnltop3 span (> foo) (showgthannumwithcolors foo) (concat $ replicate 2 [y, (pred y)..(y - z)]) | x <- [2, 3], y <- [9, 8, 7], z <- [5, 6] ]
subdeck12cminextlist = [ let foo = succn x y in minextmakerfnsttop4 span (< foo) (showlthancharwithcolors foo) (concat $ replicate 2 [y..(succn z y)]) | x <- [2, 3], y <- "ajr", z <- [5, 6] ]
subdeck12dminextlist = [ let foo = predn x y in minextmakerfnsttop4 span (> foo) (showgthancharwithcolors foo) (concat $ replicate 2 [y, (pred y)..(predn z y)]) | x <- [2, 3], y <- "zng", z <- [5, 6] ]
subdeck12minextlist = concat [subdeck12aminextlist, subdeck12bminextlist, subdeck12cminextlist, subdeck12dminextlist]

subdeck13aminextlist = [ let foo = x + y in minextmakerfnnltop3 break (> foo) (showgthannumwithcolors foo) (concat $ replicate 2 [y..(y + z)]) | x <- [2, 3], y <- [1, 2, 3], z <- [5, 6] ]
subdeck13bminextlist = [ let foo = y - x in minextmakerfnnltop3 break (< foo) (showlthannumwithcolors foo) (concat $ replicate 2 [y, (pred y)..(y - z)]) | x <- [2, 3], y <- [9, 8, 7], z <- [5, 6] ]
subdeck13cminextlist = [ let foo = succn x y in minextmakerfnsttop4 break (> foo) (showgthancharwithcolors foo) (concat $ replicate 2 [y..(succn z y)]) | x <- [2, 3], y <- "ajr", z <- [5, 6] ]
subdeck13dminextlist = [ let foo = predn x y in minextmakerfnsttop4 break (< foo) (showlthancharwithcolors foo) (concat $ replicate 2 [y, (pred y)..(predn z y)]) | x <- [2, 3], y <- "zng", z <- [5, 6] ]
subdeck13minextlist = concat [subdeck13aminextlist, subdeck13bminextlist, subdeck13cminextlist, subdeck13dminextlist]

subdeck14aminextlist = [ concat [termopen1, showstrwithescapesandcolor (x ++ "\\\\n" ++ y ++ "\\\\n" ++ z), newline, showstrlistwithescapesandcolors $ sd14fun1 x y z, newline, prelprompt] | x <- ["potato", "rabbit"], y <- ["carrot", "donkey", "octopus"], z <- ["cheese", "turtle", "peanut"] ]
subdeck14bminextlist = [ concat [termopen1, showstrwithescapesandcolor (x ++ "\\\\n" ++ y ++ "\\\\n" ++ z ++ "\\\\n" ++ w), newline, showstrlistwithescapesandcolors $ sd14fun2 x y z w, newline, prelprompt] | x <- ["pickle", "snake"], y <- ["butttraps", "pizza", "tomato"], z <- ["orange", "pepper"], w <- ["horse", "cherry"] ]
sd14fun1 x y z = lines (x ++ "\n" ++ y ++ "\n" ++ z)
sd14fun2 x y z w = lines (x ++ "\n" ++ y ++ "\n" ++ z ++ "\n" ++ w)
-- Custom functions are here because calling the deck maker helpers won't work with what we need to do here with newline characters?????
subdeck14minextlist = concat [subdeck14aminextlist, subdeck14bminextlist]

subdeck15aminextlist = [ minextmakersttosl words $ intercalate " " [x, y, z] |  x <- ["pepper", "peanut"], y <- ["tomato", "pizza", "snake"], z <- ["orange", "tiger", "horse"] ]
subdeck15bminextlist = [ minextmakersttosl words $ intercalate " " [x, y, z, w] |  x <- ["cherry", "octopus"], y <- ["cheese", "donkey"], z <- ["carrot", "potato", "esquilax"], w <- ["rabbit", "beetle"] ]
subdeck15minextlist = concat [subdeck15aminextlist, subdeck15bminextlist]

subdeck16aminextlist = [ concat [termopen1, showstrlistwithescapesandcolors [x, y, z], newline, showstrwithescapesandcolor $ sd16fun1 x y z, newline, prelprompt] | x <- ["pizza", "octopus"], y <- ["insect", "potato", "tiger"], z <- ["donkey", "pepper", "turtle"] ]
subdeck16bminextlist = [ concat [termopen1, showstrlistwithescapesandcolors [x, y, z, w], newline, showstrwithescapesandcolor $ sd16fun2 x y z w, newline, prelprompt] | x <- ["horse", "cheese"], y <- ["snake", "pickle", "fnord"], z <- ["carrot", "orange"], w <- ["beetle", "peanut"] ]
sd16fun1 x y z = intercalate "\\\\n" [x, y, z]
sd16fun2 x y z w = intercalate "\\\\n" [x, y, z, w]
-- Custom functions are here because calling the deck maker helpers won't work with what we need to do here with newline characters?????
subdeck16minextlist = concat [subdeck16aminextlist, subdeck16bminextlist]

subdeck17aminextlist = [ minextmakersltost unwords $ [x, y, z] |  x <- ["potato", "insect"], y <- ["carrot", "beetle", "pizza"], z <- ["turtle", "tiger", "octopus"] ]
subdeck17bminextlist = [ minextmakersltost unwords $ [x, y, z, w] |  x <- ["rabbit", "orange"], y <- ["pepper", "cherry"], z <- ["donkey", "pickle", "croggle"], w <- ["horse", "snake"] ]
subdeck17minextlist = concat [subdeck17aminextlist, subdeck17bminextlist]

subdeck18aminextlist = [ minextmakernutost show x |  x <- [0, 3, 9, 37, 49, 65] ]
subdeck18bminextlist = [ minextmakernltost show [x, y, z] |  x <- [7, 58], y <- [0, 10], z <- [2, 15] ]
subdeck18cminextlist = [ concat [termopen1, showcharwithescapesandcolor x, newline, showstrwithescapesandcolor $ sd18cfun x, newline, prelprompt] |  x <- "ejmptw" ]
   where sd18cfun x = concat ["\\\'", [x], "\\\'"]
subdeck18dminextlist = [ concat [termopen1, showstrwithescapesandcolor x, newline, showstrwithescapesandcolor $ sd18dfun x, newline, prelprompt] |  x <- ["octopus", "turtle", "snake", "cheese", "peanut", "pizza", "tomato"] ]
   where sd18dfun x = concat ["\\\\\\\"", x, "\\\\\\\""]
subdeck18eminextlist = [ minextmakerp1tost show (x, y) |  x <- [6, 8, 86], y <- [9, 55] ]
subdeck18fminextlist = [ concat [termopen1, showpewithescapesandcolors (x, y), newline, showstrwithescapesandcolor $ sd18ffun (x,y), newline, prelprompt] |  x <- ["cherry", "tiger", "horse"], y <- [40, 63] ]
   where sd18ffun (x, y) = concat ["(\\\\\\\"", x, "\\\\\\\"", ",", show y, ")"]
subdeck18gminextlist = [ concat [termopen1, showpawithescapesandcolors (x, y), newline, showstrwithescapesandcolor $ sd18gfun (x,y), newline, prelprompt] |  x <- "at", y <- ["carrot", "tiger", "cromulent"] ]
   where sd18gfun (x, y) = concat ["('", [x], "',", "\\\\\\\"", y, "\\\\\\\"", ")"]
subdeck18minextlist = concat [subdeck18aminextlist, subdeck18bminextlist, subdeck18cminextlist, subdeck18dminextlist, subdeck18eminextlist, subdeck18fminextlist, subdeck18gminextlist]

subdeck19aminextlist = [ concat [termopen1, showstrwithescapesandcolor $ show x, space, fourdotwithcolor, space, htmlcolor2 "Int", newline, shownumwithcolor x, newline, prelprompt] |  x <- [2, 7, 8, 24, 46, 85] ]
subdeck19bminextlist = [ concat [termopen1, showstrwithescapesandcolor $ show [x, y, z], space, fourdotwithcolor, space, htmlcolor2 "[Int]", newline, shownumlistwithcolors [x, y, z], newline, prelprompt] | x <- [1, 81], y <- [3, 97], z <- [6, 13] ]
subdeck19cminextlist = [ concat [termopen1, showstrwithescapesandcolor $ show x, space, fourdotwithcolor, space, htmlcolor2 "Char", newline, showcharwithescapesandcolor x, newline, prelprompt] | x <- "cghnor" ]
subdeck19dminextlist = [ concat [termopen1, showstrwithescapesandcolor $ sd19dfun x, space, fourdotwithcolor, space, htmlcolor2 "String", newline, showstrwithescapesandcolor x, newline, prelprompt] | x <- ["tiger", "potato", "donkey", "peanut", "carrot", "fnord", "cherry"] ]
   where sd19dfun x = concat ["\\\\\\\"", x, "\\\\\\\""]
subdeck19eminextlist = [ concat [termopen1, showstrwithescapesandcolor $ show (x,y), space, fourdotwithcolor, space, htmlcolor2 "(Int, Int)", newline, showp1withcolors (x,y), newline, prelprompt] |  x <- [0, 5, 75], y <- [9, 88] ]
subdeck19fminextlist = [ concat [termopen1, showstrwithescapesandcolor $ sd19ffun (x,y), space, fourdotwithcolor, space, htmlcolor2 "(String, Int)", newline, showpewithescapesandcolors (x,y), newline, prelprompt] |  x <- ["pepper", "pizza", "peanut"], y <- [35, 54] ]
   where sd19ffun (x, y) = concat ["(\\\\\\\"", x, "\\\\\\\"", ",", show y, ")"]
subdeck19gminextlist = [ concat [termopen1, showstrwithescapesandcolor $ sd19gfun (x,y), space, fourdotwithcolor, space, htmlcolor2 "(Char, String)", newline, showpawithescapesandcolors (x,y), newline, prelprompt] |  x <- "lm", y <- ["turtle", "cheese", "insect"] ]
   where sd19gfun (x, y) = concat ["('", [x], "',", "\\\\\\\"", y, "\\\\\\\"", ")"]
subdeck19minextlist = concat [subdeck19aminextlist, subdeck19bminextlist, subdeck19cminextlist, subdeck19dminextlist, subdeck19eminextlist, subdeck19fminextlist, subdeck19gminextlist]

subdeck20aminextlist = [ concat [termopen1, shownumwithcolor x, newline, shownumwithcolor x, newline, prelprompt, printduplicatewarning] |  x <- [1, 3, 7, 14, 65, 72] ]
subdeck20bminextlist = [ concat [termopen1, shownumlistwithcolors [x, y, z], newline, shownumlistwithcolors [x, y, z], newline, prelprompt, printduplicatewarning] |  x <- [4, 63], y <- [8, 57], z <- [9, 29] ]
subdeck20cminextlist = [ concat [termopen1, showcharwithescapesandcolor x, newline, showcharwithescapesandcolor x, newline, prelprompt, printduplicatewarning] |  x <- "jluxyz" ]
subdeck20dminextlist = [ concat [termopen1, showstrwithescapesandcolor x, newline, showstrwithescapesandcolor x, newline, prelprompt, printduplicatewarning] |  x <- ["snake", "beetle", "horse", "butttraps", "potato", "cheese", "octopus", "peanut"] ]
subdeck20eminextlist = [ concat [termopen1, showp1withcolors (x, y), newline, showp1withcolors (x, y), newline, prelprompt, printduplicatewarning] |  x <- [5, 6, 18], y <- [2, 28] ]
subdeck20fminextlist = [ concat [termopen1, showpewithescapesandcolors (x, y), newline, showpewithescapesandcolors (x, y), newline, prelprompt, printduplicatewarning] |  x <- ["rabbit", "cherry", "pickle"], y <- [77, 91] ]
subdeck20gminextlist = [ concat [termopen1, showpawithescapesandcolors (x, y), newline, showpawithescapesandcolors (x, y), newline, prelprompt, printduplicatewarning] |  x <- "av", y <- ["turtle", "carrot", "pizza"] ]
subdeck20minextlist = concat [subdeck20aminextlist, subdeck20bminextlist, subdeck20cminextlist, subdeck20dminextlist, subdeck20eminextlist, subdeck20fminextlist, subdeck20gminextlist]
printduplicatewarning = concat [showtermcommentwithcolor "" "-- (This can be called as an IO operation)", newline, prelprompt]

subdeck21minextlist = [ concat [termopen1, showcharwithescapesandcolor x, newline, htmlcolor2 [x], prelprompt] |  x <- ['a'..'z'] ++ ['A'..'Z'] ]

subdeck22minextlist = [ concat [termopen1, showstrwithescapesandcolor x, newline, htmlcolor2 x, prelprompt] |  x <- samplewords1 ]

subdeck23minextlist = [ concat [termopen1, showstrwithescapesandcolor x, newline, htmlcolor2 x, newline, prelprompt] |  x <- samplewords1 ]

subdeck24minextlist = [ concat [termopen1, newline, htmlcolor2 [x], htmlcolor1 "  <-- *typed by user*", newline, showcharwithescapesandcolor x, newline, prelprompt] |  x <- "1234567890!@#$%^&*()+-/;:,.wajlydtosfceWCBPQTNHSFXD" ]

subdeck25minextlist = [ concat [termopen1, newline, htmlcolor2 x, htmlcolor1 "  <-- *typed by user*", newline, showstrwithescapesandcolor x, newline, prelprompt] |  x <- samplewords1 ]

-- These lines define the card ID Strings.
subdeck01cardids = map (\n -> "Q1D01" ++ showlastindex n) [1..(length subdeck01minextlist)]
subdeck02cardids = map (\n -> "Q1D02" ++ showlastindex n) [1..(length subdeck02minextlist)]
subdeck03cardids = map (\n -> "Q1D03" ++ showlastindex n) [1..(length subdeck03minextlist)]
subdeck04cardids = map (\n -> "Q1D04" ++ showlastindex n) [1..(length subdeck04minextlist)]
subdeck05cardids = map (\n -> "Q1D05" ++ showlastindex n) [1..(length subdeck05minextlist)]
subdeck06cardids = map (\n -> "Q1D06" ++ showlastindex n) [1..(length subdeck06minextlist)]
--subdeck07cardids = map (\n -> "Q1D07" ++ showlastindex n) [1..(length subdeck07minextlist)]
subdeck08cardids = map (\n -> "Q1D08" ++ showlastindex n) [1..(length subdeck08minextlist)]
subdeck09cardids = map (\n -> "Q1D09" ++ showlastindex n) [1..(length subdeck09minextlist)]
subdeck10cardids = map (\n -> "Q1D10" ++ showlastindex n) [1..(length subdeck10minextlist)]
subdeck11cardids = map (\n -> "Q1D11" ++ showlastindex n) [1..(length subdeck11minextlist)]
subdeck12cardids = map (\n -> "Q1D12" ++ showlastindex n) [1..(length subdeck12minextlist)]
subdeck13cardids = map (\n -> "Q1D13" ++ showlastindex n) [1..(length subdeck13minextlist)]
subdeck14cardids = map (\n -> "Q1D14" ++ showlastindex n) [1..(length subdeck14minextlist)]
subdeck15cardids = map (\n -> "Q1D15" ++ showlastindex n) [1..(length subdeck15minextlist)]
subdeck16cardids = map (\n -> "Q1D16" ++ showlastindex n) [1..(length subdeck16minextlist)]
subdeck17cardids = map (\n -> "Q1D17" ++ showlastindex n) [1..(length subdeck17minextlist)]
subdeck18cardids = map (\n -> "Q1D18" ++ showlastindex n) [1..(length subdeck18minextlist)]
subdeck19cardids = map (\n -> "Q1D19" ++ showlastindex n) [1..(length subdeck19minextlist)]
subdeck20cardids = map (\n -> "Q1D20" ++ showlastindex n) [1..(length subdeck20minextlist)]
subdeck21cardids = map (\n -> "Q1D21" ++ showlastindex n) [1..(length subdeck21minextlist)]
subdeck22cardids = map (\n -> "Q1D22" ++ showlastindex n) [1..(length subdeck22minextlist)]
subdeck23cardids = map (\n -> "Q1D23" ++ showlastindex n) [1..(length subdeck23minextlist)]
subdeck24cardids = map (\n -> "Q1D24" ++ showlastindex n) [1..(length subdeck24minextlist)]
subdeck25cardids = map (\n -> "Q1D25" ++ showlastindex n) [1..(length subdeck25minextlist)]

-- These lines are the values for the description of the function for each subdeck.
subdeck01descriptions = repeat "This function indicates whether a thing is greater than, less than, or equal to another thing."
subdeck02descriptions = repeat "This function converts a number of any integral type to any numerical type, such as a Float."
subdeck03descriptions = repeat "This function converts a number of type Integer to any numerical type, such as a Float."
subdeck04descriptions = repeat "This function divides two whole numbers and returns an integer equal to the greatest whole number of their quotient (excludes the remainder)."
subdeck05descriptions = repeat "This function returns the remainder resulting from dividing two whole numbers."
subdeck06descriptions = repeat "This function divides two whole numbers, and returns a pair with the fst being the greatest whole number of the quotient and the snd being the remainder."
subdeck07descriptions = repeat "This function takes a function of two things and swaps the first and second inputs."
subdeck08descriptions = repeat "This function takes a predicate and indicates whether any of the items in a list satisfy it."
subdeck09descriptions = repeat "This function takes a predicate and indicates whether all of the items in a list satisfy it."
subdeck10descriptions = repeat "This function takes a predicate and returns the leading part of a list containing items that satisfy the predicate."
subdeck11descriptions = repeat "This function takes a predicate and returns the tailing part of a list that starts with the first item that doesn't satisfy the predicate."
subdeck12descriptions = repeat "This function takes a predicate and returns a pair of lists with the fst being the leading part of a list containing items that satisfy the predicate and the snd being the tailing part of the list starting with the first item that doesn't satisfy the predicate."
subdeck13descriptions = repeat "This function takes a predicate and returns a pair of lists with the fst being the leading part of a list containing items that don't satisfy the predicate and the snd being the tailing part of the list starting with the first item that does satisfy the predicate."
subdeck14descriptions = repeat "This function takes a newline-delineated String and returns a list whose items are all the sub-Strings between the newline characters."
subdeck15descriptions = repeat "This function takes a String and returns a list whose items are all the sub-Strings between the spaces."
subdeck16descriptions = repeat "This function takes a list of Strings and returns a single String that joins the input Strings with newline characters between them."
subdeck17descriptions = repeat "This function takes a list of Strings and returns a single String that joins the input Strings with spaces between them."
subdeck18descriptions = repeat "This function converts any type to a String."
subdeck19descriptions = repeat "This function converts from a String to any type."
subdeck20descriptions = repeat "This function outputs a value of any printable type to the standard output device."
subdeck21descriptions = repeat "This function writes a Char to the standard output device."
subdeck22descriptions = repeat "This function writes a String to the standard output device."
subdeck23descriptions = repeat "This function writes a String and a newline character to the standard output device."
subdeck24descriptions = repeat "This function reads a Char from the standard input device."
subdeck25descriptions = repeat "This function reads a line from the standard input device."

-- These lines are the answers for the name of the function for each subdeck.
subdeck01answers = repeat "compare"
subdeck02answers = repeat "fromIntegral"
subdeck03answers = repeat "fromInteger"
subdeck04answers = repeat "div"
subdeck05answers = repeat "mod"
subdeck06answers = repeat "divMod"
subdeck07answers = repeat "flip"
subdeck08answers = repeat "any"
subdeck09answers = repeat "all"
subdeck10answers = repeat "takeWhile"
subdeck11answers = repeat "dropWhile"
subdeck12answers = repeat "span"
subdeck13answers = repeat "break"
subdeck14answers = repeat "lines"
subdeck15answers = repeat "words"
subdeck16answers = repeat "unlines"
subdeck17answers = repeat "unwords"
subdeck18answers = repeat "show"
subdeck19answers = repeat "read"
subdeck20answers = repeat "print"
subdeck21answers = repeat "putChar"
subdeck22answers = repeat "putStr"
subdeck23answers = repeat "putStrLn"
subdeck24answers = repeat "getChar"
subdeck25answers = repeat "getLine"

-- These lines call up the functions that zip together all the specific subdeck things from this hs file using all the magic in Deckmakerhelpers.hs
-- That gets the results up to the level of subdeck strings.  Those, when joined and a footer appended, are the exact text to write to make the deck in js.
subdeck01string = writejssubdeckstring subdeck01cardids subdeck01descriptions subdeck01minextlist subdeck01answers
subdeck02string = writejssubdeckstring subdeck02cardids subdeck02descriptions subdeck02minextlist subdeck02answers
subdeck03string = writejssubdeckstring subdeck03cardids subdeck03descriptions subdeck03minextlist subdeck03answers
subdeck04string = writejssubdeckstring subdeck04cardids subdeck04descriptions subdeck04minextlist subdeck04answers
subdeck05string = writejssubdeckstring subdeck05cardids subdeck05descriptions subdeck05minextlist subdeck05answers
subdeck06string = writejssubdeckstring subdeck06cardids subdeck06descriptions subdeck06minextlist subdeck06answers
--subdeck07string = writejssubdeckstring subdeck07cardids subdeck07descriptions subdeck07minextlist subdeck07answers
subdeck08string = writejssubdeckstring subdeck08cardids subdeck08descriptions subdeck08minextlist subdeck08answers
subdeck09string = writejssubdeckstring subdeck09cardids subdeck09descriptions subdeck09minextlist subdeck09answers
subdeck10string = writejssubdeckstring subdeck10cardids subdeck10descriptions subdeck10minextlist subdeck10answers
subdeck11string = writejssubdeckstring subdeck11cardids subdeck11descriptions subdeck11minextlist subdeck11answers
subdeck12string = writejssubdeckstring subdeck12cardids subdeck12descriptions subdeck12minextlist subdeck12answers
subdeck13string = writejssubdeckstring subdeck13cardids subdeck13descriptions subdeck13minextlist subdeck13answers
subdeck14string = writejssubdeckstring subdeck14cardids subdeck14descriptions subdeck14minextlist subdeck14answers
subdeck15string = writejssubdeckstring subdeck15cardids subdeck15descriptions subdeck15minextlist subdeck15answers
subdeck16string = writejssubdeckstring subdeck16cardids subdeck16descriptions subdeck16minextlist subdeck16answers
subdeck17string = writejssubdeckstring subdeck17cardids subdeck17descriptions subdeck17minextlist subdeck17answers
subdeck18string = writejssubdeckstring subdeck18cardids subdeck18descriptions subdeck18minextlist subdeck18answers
subdeck19string = writejssubdeckstring subdeck19cardids subdeck19descriptions subdeck19minextlist subdeck19answers
subdeck20string = writejssubdeckstring subdeck20cardids subdeck20descriptions subdeck20minextlist subdeck20answers
subdeck21string = writejssubdeckstring subdeck21cardids subdeck21descriptions subdeck21minextlist subdeck21answers
subdeck22string = writejssubdeckstring subdeck22cardids subdeck22descriptions subdeck22minextlist subdeck22answers
subdeck23string = writejssubdeckstring subdeck23cardids subdeck23descriptions subdeck23minextlist subdeck23answers
subdeck24string = writejssubdeckstring subdeck24cardids subdeck24descriptions subdeck24minextlist subdeck24answers
subdeck25string = writejssubdeckstring subdeck25cardids subdeck25descriptions subdeck25minextlist subdeck25answers

-- These lines define the lines that go in the footer of the output deck.  Those lines list all the cards in each subdeck.
q1D01cardidsshownjs = "var Q1D01 = [" ++ intercalate "," subdeck01cardids ++ "];"
q1D02cardidsshownjs = "var Q1D02 = [" ++ intercalate "," subdeck02cardids ++ "];"
q1D03cardidsshownjs = "var Q1D03 = [" ++ intercalate "," subdeck03cardids ++ "];"
q1D04cardidsshownjs = "var Q1D04 = [" ++ intercalate "," subdeck04cardids ++ "];"
q1D05cardidsshownjs = "var Q1D05 = [" ++ intercalate "," subdeck05cardids ++ "];"
q1D06cardidsshownjs = "var Q1D06 = [" ++ intercalate "," subdeck06cardids ++ "];"
--q1D07cardidsshownjs = "var Q1D07 = [" ++ intercalate "," subdeck07cardids ++ "];"
q1D08cardidsshownjs = "var Q1D08 = [" ++ intercalate "," subdeck08cardids ++ "];"
q1D09cardidsshownjs = "var Q1D09 = [" ++ intercalate "," subdeck09cardids ++ "];"
q1D10cardidsshownjs = "var Q1D10 = [" ++ intercalate "," subdeck10cardids ++ "];"
q1D11cardidsshownjs = "var Q1D11 = [" ++ intercalate "," subdeck11cardids ++ "];"
q1D12cardidsshownjs = "var Q1D12 = [" ++ intercalate "," subdeck12cardids ++ "];"
q1D13cardidsshownjs = "var Q1D13 = [" ++ intercalate "," subdeck13cardids ++ "];"
q1D14cardidsshownjs = "var Q1D14 = [" ++ intercalate "," subdeck14cardids ++ "];"
q1D15cardidsshownjs = "var Q1D15 = [" ++ intercalate "," subdeck15cardids ++ "];"
q1D16cardidsshownjs = "var Q1D16 = [" ++ intercalate "," subdeck16cardids ++ "];"
q1D17cardidsshownjs = "var Q1D17 = [" ++ intercalate "," subdeck17cardids ++ "];"
q1D18cardidsshownjs = "var Q1D18 = [" ++ intercalate "," subdeck18cardids ++ "];"
q1D19cardidsshownjs = "var Q1D19 = [" ++ intercalate "," subdeck19cardids ++ "];"
q1D20cardidsshownjs = "var Q1D20 = [" ++ intercalate "," subdeck20cardids ++ "];"
q1D21cardidsshownjs = "var Q1D21 = [" ++ intercalate "," subdeck21cardids ++ "];"
q1D22cardidsshownjs = "var Q1D22 = [" ++ intercalate "," subdeck22cardids ++ "];"
q1D23cardidsshownjs = "var Q1D23 = [" ++ intercalate "," subdeck23cardids ++ "];"
q1D24cardidsshownjs = "var Q1D24 = [" ++ intercalate "," subdeck24cardids ++ "];"
q1D25cardidsshownjs = "var Q1D25 = [" ++ intercalate "," subdeck25cardids ++ "];"

-- The footer of the deck has a line for each subdeck and each subdeck's line lists the names of the cards in it.
deck1dfooter1string = intercalate "\n" [q1D01cardidsshownjs, q1D02cardidsshownjs, q1D03cardidsshownjs, q1D04cardidsshownjs, q1D05cardidsshownjs, q1D06cardidsshownjs{-, q1D07cardidsshownjs-}, q1D08cardidsshownjs, q1D09cardidsshownjs, q1D10cardidsshownjs, q1D11cardidsshownjs, q1D12cardidsshownjs, q1D13cardidsshownjs, q1D14cardidsshownjs, q1D15cardidsshownjs, q1D16cardidsshownjs, q1D17cardidsshownjs, q1D18cardidsshownjs, q1D19cardidsshownjs, q1D20cardidsshownjs, q1D21cardidsshownjs, q1D22cardidsshownjs, q1D23cardidsshownjs, q1D24cardidsshownjs, q1D25cardidsshownjs]

-- The end of the footer of the deck has the name of the deck and the names of all the subdecks as an array.
deck1dfooter2string = "var Q1Dall = [" ++ subdecklistshown ++ "];"
   where subdecklistshown = intercalate "," qtaglist 
         qtaglist = map qtag ([1..6] ++ [8..25]) --CHANGE AS DECK IS BUILT
         qtag inpnum = if inpnum < 10 then "Q1D0" ++ show inpnum else "Q1D" ++ show inpnum

-- The output string is made of each subdeck rendered to string plus the footer strings
deckntf31djsfilestring = concat [subdeck01string, subdeck02string, subdeck03string, subdeck04string, subdeck05string, subdeck06string{-, subdeck07string-}, subdeck08string, subdeck09string, subdeck10string, subdeck11string, subdeck12string, subdeck13string, subdeck14string, subdeck15string, subdeck16string, subdeck17string, subdeck18string, subdeck19string, subdeck20string, subdeck21string, subdeck22string, subdeck23string, subdeck24string, subdeck25string, deck1dfooter1string, "\n", deck1dfooter2string]

-- main is the singular IO operation, which
-- takes the whole deck rendered to a string and writes it as a .js file
-- containing each card's name, terminal text, and answer,
-- each subdeck's list of cards, and the whole deck's list of subdecks.
main = writeFile "deck_ntf3_1d.js" deckntf31djsfilestring
