import Deckmakerhelpers
import Data.List(intercalate)

-- go = main because I like to be able to open the .hs file and then type "go" to make it do the thing.
go = main

-- Some custom terminal text makers for subdecks with outputs that don't match the generic patterns.
minextmakercustom06a inpstr  = concat [termopen1, emptystringwithescapesandcolor, newline, truevaluewithcolor, newline, termopen1, showstrwithescapesandcolor inpstr, newline, falsevaluewithcolor, newline, prelprompt]
minextmakercustom06b inpstr  = concat [termopen1, emptylistwithcolor, newline, truevaluewithcolor, newline, termopen1, showstrwithescapesandcolor inpstr, newline, falsevaluewithcolor, newline, prelprompt]
minextmakercustom06c inpstr  = concat [termopen1, showstrwithescapesandcolor inpstr, newline, falsevaluewithcolor, newline, termopen1, emptystringwithescapesandcolor, newline, truevaluewithcolor, newline, prelprompt]
minextmakercustom06d inpstr  = concat [termopen1, showstrwithescapesandcolor inpstr, newline, falsevaluewithcolor, newline, termopen1, emptylistwithcolor, newline, truevaluewithcolor, newline, prelprompt]
minextmakercustom06e inplist = concat [termopen1, emptystringwithescapesandcolor, newline, truevaluewithcolor, newline, termopen1, shownumlistwithcolors inplist, newline, falsevaluewithcolor, newline, prelprompt]
minextmakercustom06f inplist = concat [termopen1, emptylistwithcolor, newline, truevaluewithcolor, newline, termopen1, shownumlistwithcolors inplist, newline, falsevaluewithcolor, newline, prelprompt]
minextmakercustom06g inplist = concat [termopen1, shownumlistwithcolors inplist, newline, falsevaluewithcolor, newline, termopen1, emptystringwithescapesandcolor, newline, truevaluewithcolor, newline, prelprompt]
minextmakercustom06h inplist = concat [termopen1, shownumlistwithcolors inplist, newline, falsevaluewithcolor, newline, termopen1, emptylistwithcolor, newline, truevaluewithcolor, newline, prelprompt]

minextmakercustom16a inpchar = concat [termopen1, showcharwithescapesandcolor inpchar, newline, htmlcolor5 ("\\\"" ++ (take 38 $ repeat inpchar)), continuedsuffix, newline, prelprompt]
minextmakercustom16b inpnum  = concat [termopen1, shownumwithcolor inpnum,             newline, dropE 40 (shownumlistwithcolors (take 19 (repeat inpnum))), continuedsuffix', newline, prelprompt]
minextmakercustom16c inpstr  = concat [termopen1, showstrwithescapesandcolor inpstr,   newline, dropE 40 (showstrlistwithescapesandcolors (take 5 (repeat inpstr))), continuedsuffix', newline, prelprompt]
minextmakercustom16d inplist = concat [termopen1, shownumlistwithcolors inplist,       newline, dropE 40 (shownumlistlistwithcolors (take 5 (repeat inplist))), continuedsuffix', newline, prelprompt]

minextmakercustom18a inpstr  = concat [termopen1, showstrwithescapesandcolor inpstr, newline, dropE 9 (showstrwithescapesandcolor (take 38 (cycle inpstr))), "</span>", continuedsuffix, newline, prelprompt]
minextmakercustom18b inplist = concat [termopen1, shownumlistwithcolors inplist, newline, dropE 40 (shownumlistwithcolors (take 19 (cycle inplist))), continuedsuffix, newline, prelprompt]

minextmakercustom19  inpstr  = concat [termopen1, showstrwithescapesandcolor inpstr, showghcitextwithcolor $ concat ["<br>*** Exception: ", inpstr, "<br>CallStack (from HasCallStack):<br>&nbsp&nbsperror, called at &lt;interactive&gt;:1:1 in interactive:Ghci1<br>Prelude> "]]

minextmakercustom20  inpstr  = concat [termopen1, showstrwithescapesandcolor inpstr, showghcitextwithcolor $ concat ["<br>*** Exception: ", inpstr, "<br>Prelude> "]]

-- Here's the code blocks for each subdeck.  Each one calls one or more of the terminal text makers.
-- In this part, most of the work is deciding exactly what inputs will be in the banks of inputs for examples.
-- These are expressed as list comprehensions with the terminal text maker functions on the left side of the |
-- and the input banks on the right side of the |
subdeck01aminextlist = [ concat [minextmakernunutonu' const x y, newline, minextmakernunutonu const y x] | x <- [4, 5, 6], y <- [3, 4, 5, 6], x /= y]
subdeck01bminextlist = [ concat [minextmakerststtost' const x y, newline, minextmakerststtost const y x] | x <- take 3 $ drop 14 samplewords1, y <- take 4 $ drop 14 samplewords1, x /= y]
subdeck01cminextlist = [ concat [minextmakernusttonu' const x y, newline, minextmakerstnutost const y x] | x <- [3, 6, 9], y <- take 3 samplewords1]
subdeck01dminextlist = [ concat [minextmakernuchtonu' const x y, newline, minextmakerchnutoch const y x] | x <- [2, 5, 8], y <- "idk"]
subdeck01eminextlist = [ concat [minextmakernlsttonl' const x y, newline, minextmakerstnltost const y x] | x <- take 3 $ drop 22 samplenumlists1, y <- take 3 $ drop 3 samplewords1]
subdeck01minextlist = concat [subdeck01aminextlist, subdeck01bminextlist, subdeck01cminextlist, subdeck01dminextlist, subdeck01eminextlist]

subdeck02aminextlist = [minextmakersttoch head x | x <- samplewords1]
subdeck02bminextlist = [minextmakernltonu head x | x <- samplenumlists1]
subdeck02minextlist = subdeck02aminextlist ++ subdeck02bminextlist

subdeck03aminextlist = [minextmakersttoch last x | x <- samplewords1]
subdeck03bminextlist = [minextmakernltonu last x | x <- samplenumlists1]
subdeck03minextlist = subdeck03aminextlist ++ subdeck03bminextlist

subdeck04aminextlist = [minextmakersttost tail x | x <- samplewords1]
subdeck04bminextlist = [minextmakernltonl tail x | x <- samplenumlists1]
subdeck04minextlist = subdeck04aminextlist ++ subdeck04bminextlist

subdeck05aminextlist = [minextmakersttost init x | x <- samplewords1]
subdeck05bminextlist = [minextmakernltonl init x | x <- samplenumlists1]
subdeck05minextlist = subdeck05aminextlist ++ subdeck05bminextlist

subdeck06abcdinplist = take 5 samplewords1
subdeck06efghinplist = take 5 samplenumlists1
subdeck06aminextlist = [minextmakercustom06a x | x <- subdeck06abcdinplist]
subdeck06bminextlist = [minextmakercustom06b x | x <- subdeck06abcdinplist]
subdeck06cminextlist = [minextmakercustom06c x | x <- subdeck06abcdinplist]
subdeck06dminextlist = [minextmakercustom06d x | x <- subdeck06abcdinplist]
subdeck06eminextlist = [minextmakercustom06e x | x <- subdeck06efghinplist]
subdeck06fminextlist = [minextmakercustom06f x | x <- subdeck06efghinplist]
subdeck06gminextlist = [minextmakercustom06g x | x <- subdeck06efghinplist]
subdeck06hminextlist = [minextmakercustom06h x | x <- subdeck06efghinplist]
subdeck06minextlist = concat [subdeck06aminextlist, subdeck06bminextlist, subdeck06cminextlist, subdeck06dminextlist, subdeck06eminextlist, subdeck06fminextlist, subdeck06gminextlist, subdeck06hminextlist]

subdeck07aminextlist = [minextmakersttonu length x | x <- samplewords1]
subdeck07bminextlist = [minextmakernltonu length x | x <- samplenumlists1]
subdeck07minextlist = subdeck07aminextlist ++ subdeck07bminextlist

subdeck08aminextlist = [concat [minextmakerchsttomh' elem x "orange", newline, minextmakerchsttomh' elem y "orange", newline, prelprompt] | x <- "ag", y <- "bk"]
subdeck08bminextlist = [concat [minextmakerchsttomh' elem y "orange", newline, minextmakerchsttomh' elem x "orange", newline, prelprompt] | x <- "ag", y <- "bk"]
subdeck08cminextlist = [concat [minextmakerchsttomh' elem x "potato", newline, minextmakerchsttomh' elem y "potato", newline, prelprompt] | x <- "ot", y <- "xv"]
subdeck08dminextlist = [concat [minextmakerchsttomh' elem y "potato", newline, minextmakerchsttomh' elem x "potato", newline, prelprompt] | x <- "ot", y <- "xv"]
subdeck08eminextlist = [concat [minextmakerchsttomh' elem x "snake" , newline, minextmakerchsttomh' elem y "snake" , newline, prelprompt] | x <- "sk", y <- "tj"]
subdeck08fminextlist = [concat [minextmakerchsttomh' elem y "snake" , newline, minextmakerchsttomh' elem x "snake" , newline, prelprompt] | x <- "sk", y <- "tj"]
subdeck08gminextlist = [concat [minextmakernunltomh' elem x [1..4] , newline, minextmakernunltomh' elem y [1..4] , newline, prelprompt] | x <- [1, 3], y <- [7, 9]]
subdeck08hminextlist = [concat [minextmakernunltomh' elem y [1..4] , newline, minextmakernunltomh' elem x [1..4] , newline, prelprompt] | x <- [1, 3], y <- [7, 9]]
subdeck08iminextlist = [concat [minextmakernunltomh' elem x [6..9] , newline, minextmakernunltomh' elem y [6..9] , newline, prelprompt] | x <- [2, 4], y <- [6, 8]]
subdeck08jminextlist = [concat [minextmakernunltomh' elem y [6..9] , newline, minextmakernunltomh' elem x [6..9] , newline, prelprompt] | x <- [2, 4], y <- [6, 8]]
subdeck08minextlist = concat [subdeck08aminextlist, subdeck08bminextlist, subdeck08cminextlist, subdeck08dminextlist, subdeck08eminextlist, subdeck08fminextlist, subdeck08gminextlist, subdeck08hminextlist, subdeck08iminextlist, subdeck08jminextlist]

subdeck09aminextlist = [concat [minextmakerchsttomh' notElem x "orange", newline, minextmakerchsttomh' notElem y "orange", newline, prelprompt] | x <- "ag", y <- "bk"]
subdeck09bminextlist = [concat [minextmakerchsttomh' notElem y "orange", newline, minextmakerchsttomh' notElem x "orange", newline, prelprompt] | x <- "ag", y <- "bk"]
subdeck09cminextlist = [concat [minextmakerchsttomh' notElem x "potato", newline, minextmakerchsttomh' notElem y "potato", newline, prelprompt] | x <- "ot", y <- "xv"]
subdeck09dminextlist = [concat [minextmakerchsttomh' notElem y "potato", newline, minextmakerchsttomh' notElem x "potato", newline, prelprompt] | x <- "ot", y <- "xv"]
subdeck09eminextlist = [concat [minextmakerchsttomh' notElem x "snake" , newline, minextmakerchsttomh' notElem y "snake" , newline, prelprompt] | x <- "sk", y <- "tj"]
subdeck09fminextlist = [concat [minextmakerchsttomh' notElem y "snake" , newline, minextmakerchsttomh' notElem x "snake" , newline, prelprompt] | x <- "sk", y <- "tj"]
subdeck09gminextlist = [concat [minextmakernunltomh' notElem x [1..4] , newline, minextmakernunltomh' notElem y [1..4] , newline, prelprompt] | x <- [1, 3], y <- [7, 9]]
subdeck09hminextlist = [concat [minextmakernunltomh' notElem y [1..4] , newline, minextmakernunltomh' notElem x [1..4] , newline, prelprompt] | x <- [1, 3], y <- [7, 9]]
subdeck09iminextlist = [concat [minextmakernunltomh' notElem x [6..9] , newline, minextmakernunltomh' notElem y [6..9] , newline, prelprompt] | x <- [2, 4], y <- [6, 8]]
subdeck09jminextlist = [concat [minextmakernunltomh' notElem y [6..9] , newline, minextmakernunltomh' notElem x [6..9] , newline, prelprompt] | x <- [2, 4], y <- [6, 8]]
subdeck09minextlist = concat [subdeck09aminextlist, subdeck09bminextlist, subdeck09cminextlist, subdeck09dminextlist, subdeck09eminextlist, subdeck09fminextlist, subdeck09gminextlist, subdeck09hminextlist, subdeck09iminextlist, subdeck09jminextlist]

subdeck10ainplist = take 10 $ drop 9 samplewords1
subdeck10binplist = map (samplenumlists1 !!) [10, 11, 13, 14, 16, 17, 18, 19, 20, 21, 22]
subdeck10aminextlist = [minextmakernusttost take x y | x <- [2, 4], y <- subdeck10ainplist]
subdeck10bminextlist = [minextmakernunltonl take x y | x <- [2, 4], y <- subdeck10binplist]
subdeck10minextlist = subdeck10aminextlist ++ subdeck10bminextlist

subdeck11ainplist = take 10 $ drop 9 samplewords1
subdeck11binplist = map (samplenumlists1 !!) [10, 11, 13, 14, 16, 17, 18, 19, 20, 21, 22]
subdeck11aminextlist = [minextmakernusttost drop x y | x <- [2, 4], y <- subdeck11ainplist]
subdeck11bminextlist = [minextmakernunltonl drop x y | x <- [2, 4], y <- subdeck11binplist]
subdeck11minextlist = subdeck11aminextlist ++ subdeck11bminextlist

subdeck12aminextlist = [minextmakerfnsttost filter (fst x) (snd x) "carrot"  | x <- [predequalcharpair 'r', prednotequalcharpair 'r', predequalcharpair 'a', prednotequalcharpair 'a'] ]
subdeck12bminextlist = [minextmakerfnsttost filter (fst x) (snd x) "potato"  | x <- [predequalcharpair 't', prednotequalcharpair 't', predequalcharpair 'o', prednotequalcharpair 'o'] ]
subdeck12cminextlist = [minextmakerfnsttost filter (fst x) (snd x) "beetle"  | x <- [predequalcharpair 'e', prednotequalcharpair 'e', predequalcharpair 't', prednotequalcharpair 't'] ]
subdeck12dminextlist = [minextmakerfnsttost filter (fst x) (snd x) "rabbit"  | x <- [predequalcharpair 'b', prednotequalcharpair 'b', predequalcharpair 'i', prednotequalcharpair 'i'] ]
subdeck12eminextlist = [minextmakerfnsttost filter (fst x) (snd x) "octopus" | x <- [predequalcharpair 'o', prednotequalcharpair 'o', predequalcharpair 'u', prednotequalcharpair 'u'] ]
subdeck12fminextlist = [minextmakerfnsttost filter (fst x) (snd x) "insect"  | x <- [predequalcharpair 's', prednotequalcharpair 's', predequalcharpair 'c', prednotequalcharpair 'c'] ]
subdeck12gminextlist = [minextmakerfnnltonl filter (fst x) (snd x) [1, 2, 3, 1, 2, 3, 1, 2, 3] | x <- [predequalnumpair 1, prednotequalnumpair 1, predequalnumpair 2, prednotequalnumpair 2, predequalnumpair 3, prednotequalnumpair 3] ]
subdeck12hminextlist = [minextmakerfnnltonl filter (fst x) (snd x) [4, 5, 6, 4, 5, 6, 4, 5, 6] | x <- [predequalnumpair 4, prednotequalnumpair 4, predequalnumpair 5, prednotequalnumpair 5, predequalnumpair 6, prednotequalnumpair 6] ]
subdeck12iminextlist = [minextmakerfnnltonl filter (fst x) (snd x) [7, 8, 9, 7, 8, 9, 7, 8, 9] | x <- [predequalnumpair 7, prednotequalnumpair 7, predequalnumpair 8, prednotequalnumpair 8, predequalnumpair 9, prednotequalnumpair 9] ]
subdeck12minextlist = concat [subdeck12aminextlist, subdeck12bminextlist, subdeck12cminextlist, subdeck12dminextlist, subdeck12eminextlist, subdeck12fminextlist, subdeck12gminextlist, subdeck12hminextlist, subdeck12iminextlist]

subdeck13aminextlist = [minextmakersttost reverse x | x <- samplewords1]
subdeck13bminextlist = [minextmakernltonl reverse x | x <- samplenumlists1]
subdeck13minextlist = subdeck13aminextlist ++ subdeck13bminextlist

subdeck14ainplist = [ [a, b, c, d] | a <- ["insect", "pizza"], b <- ["orange", "potato"], c <- ["snake", "carrot"], d <- ["horse", "beetle"] ]
subdeck14binplist = [ [a, b, c] | a <- ["rabbit", "octopus"], b <- ["donkey", "cherry"], c <- ["turtle", "cheese"] ]
subdeck14cinplist = [ [a, b, c, d] | a <- [[1, 2, 3], [7, 8, 9]], b <- [[1, 2, 3], [4, 5, 6]], c <- [[7, 8, 9], [1, 2, 3]], d <- [[4, 5, 6], [7, 8, 9]] ]
subdeck14dinplist = [ [a, b, c] | a <- [[4, 5, 6], [1, 2, 3]], b <- [[7, 8, 9],  [1, 2, 3]], c <- [[7, 8, 9],  [1, 2, 3]] ]
subdeck14aminextlist = [minextmakersltost concat x | x <- subdeck14ainplist]
subdeck14bminextlist = [minextmakersltost concat x | x <- subdeck14binplist]
subdeck14cminextlist = [minextmakernmtonl concat x | x <- subdeck14cinplist]
subdeck14dminextlist = [minextmakernmtonl concat x | x <- subdeck14dinplist]
subdeck14minextlist = subdeck14aminextlist ++ subdeck14bminextlist ++ subdeck14cminextlist ++ subdeck14dminextlist

subdeck15ainplist = take 10 (drop 5 samplewords1)
subdeck15binplist = take 10 (drop 5 samplenumlists1)
subdeck15aminextlist = [minextmakernusttosp splitAt x y | x <- [2, 4], y <- subdeck15ainplist]
subdeck15bminextlist = [minextmakernunltonp splitAt x y | x <- [2, 4], y <- subdeck15binplist]
subdeck15minextlist = subdeck15aminextlist ++ subdeck15bminextlist

subdeck16cinplist = take 4 (drop 15 samplewords1) ++ take 6 samplewords1
subdeck16dinplist = [[1,2,3], [2,3,4], [3,4,5], [4,5,6], [5,6,7], [6,7,8], [7,8,9], [9,8,7], [8,7,6], [7,6,5], [6,5,4], [5,4,3], [4,3,2], [3,2,1]]
subdeck16aminextlist = [minextmakercustom16a x | x <- "cromulent"]
subdeck16bminextlist = [minextmakercustom16b x | x <- [0..9]]
subdeck16cminextlist = [minextmakercustom16c x | x <- subdeck16cinplist]
subdeck16dminextlist = [minextmakercustom16d x | x <- subdeck16dinplist]
subdeck16minextlist = concat [subdeck16aminextlist, subdeck16bminextlist, subdeck16cminextlist, subdeck16dminextlist]

subdeck17dinplist = ["rabbit","cherry","pickle"]
subdeck17aminextlist = [minextmakernunltonm replicate x y | x <- [2, 3, 4], y <- [[1, 2, 3], [4, 5, 6], [7, 8, 9]]]
subdeck17bminextlist = [minextmakernunutonl replicate x y | x <- [3, 4, 5], y <- [3, 4, 5, 6], x /= y]
subdeck17cminextlist = [minextmakernuchtost replicate x y | x <- [3, 4, 5], y <- "fnord"]
subdeck17dminextlist = [minextmakernusttosl replicate x y | x <- [3, 4, 5], y <- subdeck17dinplist]
subdeck17minextlist = concat [subdeck17aminextlist, subdeck17bminextlist, subdeck17cminextlist, subdeck17dminextlist]

subdeck18binplist = [[1,2,3], [2,3,4], [3,4,5], [4,5,6], [5,6,7], [6,7,8], [7,8,9], [9,8,7], [8,7,6], [7,6,5], [6,5,4], [5,4,3], [4,3,2], [3,2,1]]
subdeck18aminextlist = [minextmakercustom18a x | x <- samplewords1]
subdeck18bminextlist = [minextmakercustom18b x | x <- subdeck18binplist]
subdeck18minextlist = subdeck18aminextlist ++ subdeck18bminextlist

subdeck19minextlist = [minextmakercustom19 x | x <- samplewords1 ]

subdeck20minextlist = [minextmakercustom20 x | x <- samplewords1 ]

subdeck21suffix = showghcitextwithcolor "<br>*** Exception: Prelude.undefined<br>CallStack (from HasCallStack):<br>&nbsp&nbsperror, called at libraries\\\\base\\\\GHC\\\\Err.hs:78:14 in base:GHC.Err<br>&nbsp&nbspundefined, called at &lt;interactive&gt;:1:1 in interactive:Ghci1"
subdeck21aminextlist = replicate 10 (concat [termopen1, subdeck21suffix, newline, prelprompt])
subdeck21bminextlist = [ concat [termopen1, shownumwithcolor x, subdeck21suffix, newline, prelprompt] | x <- [1..7] ]
subdeck21cminextlist = [ concat [termopen1, showcharwithescapesandcolor x, subdeck21suffix, newline, prelprompt] | x <- "prickly" ]
subdeck21dminextlist = [ concat [termopen1, shownumwithcolor x, space, shownumwithcolor y, subdeck21suffix, newline, prelprompt] | x <- [5, 7], y <- [3, 6, 4] ]
subdeck21eminextlist = [ concat [termopen1, showstrwithescapesandcolor x, space, shownumwithcolor y, subdeck21suffix, newline, prelprompt] | x <- take 2 samplewords1, y <- [5, 7] ]
subdeck21fminextlist = [ concat [termopen1, shownumwithcolor x, space, showstrwithescapesandcolor y, subdeck21suffix, newline, prelprompt] | x <- [5, 7], y <- take 2 samplewords1 ]
subdeck21gminextlist = [ concat [termopen1, showcharwithescapesandcolor x, space, showcharwithescapesandcolor y, subdeck21suffix, newline, prelprompt] | x <- "fqx", y <- "tz" ]
subdeck21minextlist = concat[subdeck21aminextlist, subdeck21bminextlist, subdeck21cminextlist, subdeck21dminextlist, subdeck21eminextlist, subdeck21fminextlist, subdeck21gminextlist]

subdeck22minextlist = [ concat [termopen1, (htmlcolor2 "(userError "), showstrwithescapesandcolor x, closeparenwithcolor, newline, showghcitextwithcolor "*** Exception: user error (", x, showghcitextwithcolor ")", newline, prelprompt] | x <- samplewords1 ]

subdeck23minextlist = [ concat [termopen1, showstrwithescapesandcolor x, newline, showghcitextwithcolor "user error (", x, showghcitextwithcolor ")", newline, prelprompt] | x <- samplewords1 ]

subdeck24minextlist = [ let txtfilename = x ++ ".txt" in concat [termopen1, showstrwithescapesandcolor txtfilename, newline, showstrwithescapesandcolor ("The contents of " ++ txtfilename), newline, prelprompt] | x <- samplewords1 ]

subdeck25inplist1 = take 7 $ drop 7 $ samplewords1
subdeck25inplist2 = take 7 samplewords1
subdeck25minextlist = [ let txtfilename = x ++ ".txt" in concat [termopen1, showstrwithescapesandcolor txtfilename, space, showstrwithescapesandcolor y, newline, showtermcommentwithcolor "Prelude> " ("-- Didn't output anything to the terminal but made " ++ txtfilename ++ " contain exactly " ++ y), newline, prelprompt] | x <- take 7 samplewords1, y <- take 7 $ drop 7 $ samplewords1 ]

subdeck26inplist1 = take 7 samplewords1
subdeck26inplist2 = take 7 $ drop 7 $ samplewords1
subdeck26minextlist = [ let txtfilename = x ++ ".txt" in concat [termopen1, showstrwithescapesandcolor txtfilename, space, showstrwithescapesandcolor y, newline, showtermcommentwithcolor "Prelude> " ("-- Didn't output anything to the terminal but added " ++ y ++ " to the end of " ++ txtfilename), newline, prelprompt] | x <- take 7 samplewords1, y <- take 7 $ drop 7 $ samplewords1 ]

-- These lines define the card ID Strings.
subdeck01cardids = map (\n -> "Q1C01" ++ showlastindex n) [1..(length subdeck01minextlist)]
subdeck02cardids = map (\n -> "Q1C02" ++ showlastindex n) [1..(length subdeck02minextlist)]
subdeck03cardids = map (\n -> "Q1C03" ++ showlastindex n) [1..(length subdeck03minextlist)]
subdeck04cardids = map (\n -> "Q1C04" ++ showlastindex n) [1..(length subdeck04minextlist)]
subdeck05cardids = map (\n -> "Q1C05" ++ showlastindex n) [1..(length subdeck05minextlist)]
subdeck06cardids = map (\n -> "Q1C06" ++ showlastindex n) [1..(length subdeck06minextlist)]
subdeck07cardids = map (\n -> "Q1C07" ++ showlastindex n) [1..(length subdeck07minextlist)]
subdeck08cardids = map (\n -> "Q1C08" ++ showlastindex n) [1..(length subdeck08minextlist)]
subdeck09cardids = map (\n -> "Q1C09" ++ showlastindex n) [1..(length subdeck09minextlist)]
subdeck10cardids = map (\n -> "Q1C10" ++ showlastindex n) [1..(length subdeck10minextlist)]
subdeck11cardids = map (\n -> "Q1C11" ++ showlastindex n) [1..(length subdeck11minextlist)]
subdeck12cardids = map (\n -> "Q1C12" ++ showlastindex n) [1..(length subdeck12minextlist)]
subdeck13cardids = map (\n -> "Q1C13" ++ showlastindex n) [1..(length subdeck13minextlist)]
subdeck14cardids = map (\n -> "Q1C14" ++ showlastindex n) [1..(length subdeck14minextlist)]
subdeck15cardids = map (\n -> "Q1C15" ++ showlastindex n) [1..(length subdeck15minextlist)]
subdeck16cardids = map (\n -> "Q1C16" ++ showlastindex n) [1..(length subdeck16minextlist)]
subdeck17cardids = map (\n -> "Q1C17" ++ showlastindex n) [1..(length subdeck17minextlist)]
subdeck18cardids = map (\n -> "Q1C18" ++ showlastindex n) [1..(length subdeck18minextlist)]
subdeck19cardids = map (\n -> "Q1C19" ++ showlastindex n) [1..(length subdeck19minextlist)]
subdeck20cardids = map (\n -> "Q1C20" ++ showlastindex n) [1..(length subdeck20minextlist)]
subdeck21cardids = map (\n -> "Q1C21" ++ showlastindex n) [1..(length subdeck21minextlist)]
subdeck22cardids = map (\n -> "Q1C22" ++ showlastindex n) [1..(length subdeck22minextlist)]
subdeck23cardids = map (\n -> "Q1C23" ++ showlastindex n) [1..(length subdeck23minextlist)]
subdeck24cardids = map (\n -> "Q1C24" ++ showlastindex n) [1..(length subdeck24minextlist)]
subdeck25cardids = map (\n -> "Q1C25" ++ showlastindex n) [1..(length subdeck25minextlist)]
subdeck26cardids = map (\n -> "Q1C26" ++ showlastindex n) [1..(length subdeck25minextlist)]

-- These lines are the values for the description of the function for each subdeck.
subdeck01descriptions = repeat "This function takes two inputs, returns equal to the first one, and does nothing with the second one."
subdeck02descriptions = repeat "This function returns the first item of a list."
subdeck03descriptions = repeat "This function returns the last item of a list."
subdeck04descriptions = repeat "This function returns all but the first item of a list."
subdeck05descriptions = repeat "This function returns all but the last item of a list."
subdeck06descriptions = repeat "This function returns True if given an empty list and False if given a non-empty list."
subdeck07descriptions = repeat "This function returns how many items are in a list."
subdeck08descriptions = repeat "This function searches a list for an item, returns True if the list contains that item, otherwise returns False."
subdeck09descriptions = repeat "This function searches a list for an item, returns False if the list contains that item, otherwise returns True."
subdeck10descriptions = repeat "This function returns the first n items of a list."
subdeck11descriptions = repeat "This function returns all but the first n items of a list."
subdeck12descriptions = repeat "This function returns all items of a list that meet a given condition."
subdeck13descriptions = repeat "This function returns a list backwards."
subdeck14descriptions = repeat "This function takes a list of lists and flattens it into a list."
subdeck15descriptions = repeat "This function returns a pair with the first value being the first n items of a list and the second value being the rest of the list."
subdeck16descriptions = repeat "This function returns an infinitely long list of an item."
subdeck17descriptions = repeat "This function returns a list of n copies of an item."
subdeck18descriptions = repeat "This function repeats a list infinitely."
subdeck19descriptions = repeat "This function causes a runtime error with a message and a stack trace.  It can go in purely functional code."
subdeck20descriptions = repeat "This function causes a runtime error with a message and no stack trace.  It can go in purely functional code."
subdeck21descriptions = repeat "This function causes a runtime error with no message but can be any type.  It can go in purely functional code."
subdeck22descriptions = repeat "This function takes a value of type IOError and raises an error in the IO monad."
subdeck23descriptions = repeat "This function makes a user error value of type IOError that contains a message."
subdeck24descriptions = repeat "This function returns a string from the contents of a file."
subdeck25descriptions = repeat "This function makes or overwrites a file of a given name to contain a given string."
subdeck26descriptions = repeat "This function adds a given string to the end of a file."

-- These lines are the answers for the name of the function for each subdeck.
subdeck01answers = repeat "const"
subdeck02answers = repeat "head"
subdeck03answers = repeat "last"
subdeck04answers = repeat "tail"
subdeck05answers = repeat "init"
subdeck06answers = repeat "null"
subdeck07answers = repeat "length"
subdeck08answers = repeat "elem"
subdeck09answers = repeat "notElem"
subdeck10answers = repeat "take"
subdeck11answers = repeat "drop"
subdeck12answers = repeat "filter"
subdeck13answers = repeat "reverse"
subdeck14answers = repeat "concat"
subdeck15answers = repeat "splitAt"
subdeck16answers = repeat "repeat"
subdeck17answers = repeat "replicate"
subdeck18answers = repeat "cycle"
subdeck19answers = repeat "error"
subdeck20answers = repeat "errorWithoutStackTrace"
subdeck21answers = repeat "undefined"
subdeck22answers = repeat "ioError"
subdeck23answers = repeat "userError"
subdeck24answers = repeat "readFile"
subdeck25answers = repeat "writeFile"
subdeck26answers = repeat "appendFile"

-- These lines call up the functions that zip together all the specific subdeck things from this hs file using all the magic in Deckmakerhelpers.hs
-- That gets the results up to the level of subdeck strings.  Those, when joined and a footer appended, are the exact text to write to make the deck in js.
subdeck01string = writejssubdeckstring subdeck01cardids subdeck01descriptions subdeck01minextlist subdeck01answers
subdeck02string = writejssubdeckstring subdeck02cardids subdeck02descriptions subdeck02minextlist subdeck02answers
subdeck03string = writejssubdeckstring subdeck03cardids subdeck03descriptions subdeck03minextlist subdeck03answers
subdeck04string = writejssubdeckstring subdeck04cardids subdeck04descriptions subdeck04minextlist subdeck04answers
subdeck05string = writejssubdeckstring subdeck05cardids subdeck05descriptions subdeck05minextlist subdeck05answers
subdeck06string = writejssubdeckstring subdeck06cardids subdeck06descriptions subdeck06minextlist subdeck06answers
subdeck07string = writejssubdeckstring subdeck07cardids subdeck07descriptions subdeck07minextlist subdeck07answers
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
subdeck26string = writejssubdeckstring subdeck26cardids subdeck26descriptions subdeck26minextlist subdeck26answers

-- These lines define the lines that go in the footer of the output deck.  Those lines list all the cards in each subdeck.
q1C01cardidsshownjs = "var Q1C01 = [" ++ intercalate "," subdeck01cardids ++ "];"
q1C02cardidsshownjs = "var Q1C02 = [" ++ intercalate "," subdeck02cardids ++ "];"
q1C03cardidsshownjs = "var Q1C03 = [" ++ intercalate "," subdeck03cardids ++ "];"
q1C04cardidsshownjs = "var Q1C04 = [" ++ intercalate "," subdeck04cardids ++ "];"
q1C05cardidsshownjs = "var Q1C05 = [" ++ intercalate "," subdeck05cardids ++ "];"
q1C06cardidsshownjs = "var Q1C06 = [" ++ intercalate "," subdeck06cardids ++ "];"
q1C07cardidsshownjs = "var Q1C07 = [" ++ intercalate "," subdeck07cardids ++ "];"
q1C08cardidsshownjs = "var Q1C08 = [" ++ intercalate "," subdeck08cardids ++ "];"
q1C09cardidsshownjs = "var Q1C09 = [" ++ intercalate "," subdeck09cardids ++ "];"
q1C10cardidsshownjs = "var Q1C10 = [" ++ intercalate "," subdeck10cardids ++ "];"
q1C11cardidsshownjs = "var Q1C11 = [" ++ intercalate "," subdeck11cardids ++ "];"
q1C12cardidsshownjs = "var Q1C12 = [" ++ intercalate "," subdeck12cardids ++ "];"
q1C13cardidsshownjs = "var Q1C13 = [" ++ intercalate "," subdeck13cardids ++ "];"
q1C14cardidsshownjs = "var Q1C14 = [" ++ intercalate "," subdeck14cardids ++ "];"
q1C15cardidsshownjs = "var Q1C15 = [" ++ intercalate "," subdeck15cardids ++ "];"
q1C16cardidsshownjs = "var Q1C16 = [" ++ intercalate "," subdeck16cardids ++ "];"
q1C17cardidsshownjs = "var Q1C17 = [" ++ intercalate "," subdeck17cardids ++ "];"
q1C18cardidsshownjs = "var Q1C18 = [" ++ intercalate "," subdeck18cardids ++ "];"
q1C19cardidsshownjs = "var Q1C19 = [" ++ intercalate "," subdeck19cardids ++ "];"
q1C20cardidsshownjs = "var Q1C20 = [" ++ intercalate "," subdeck20cardids ++ "];"
q1C21cardidsshownjs = "var Q1C21 = [" ++ intercalate "," subdeck21cardids ++ "];"
q1C22cardidsshownjs = "var Q1C22 = [" ++ intercalate "," subdeck22cardids ++ "];"
q1C23cardidsshownjs = "var Q1C23 = [" ++ intercalate "," subdeck23cardids ++ "];"
q1C24cardidsshownjs = "var Q1C24 = [" ++ intercalate "," subdeck24cardids ++ "];"
q1C25cardidsshownjs = "var Q1C25 = [" ++ intercalate "," subdeck25cardids ++ "];"
q1C26cardidsshownjs = "var Q1C26 = [" ++ intercalate "," subdeck26cardids ++ "];"

-- The footer of the deck has a line for each subdeck and each subdeck's line lists the names of the cards in it.
deck1cfooter1string = intercalate "\n" [q1C01cardidsshownjs, q1C02cardidsshownjs, q1C03cardidsshownjs, q1C04cardidsshownjs, q1C05cardidsshownjs, q1C06cardidsshownjs, q1C07cardidsshownjs, q1C08cardidsshownjs, q1C09cardidsshownjs, q1C10cardidsshownjs, q1C11cardidsshownjs, q1C12cardidsshownjs, q1C13cardidsshownjs, q1C14cardidsshownjs, q1C15cardidsshownjs, q1C16cardidsshownjs, q1C17cardidsshownjs, q1C18cardidsshownjs, q1C19cardidsshownjs, q1C20cardidsshownjs, q1C21cardidsshownjs, q1C22cardidsshownjs, q1C23cardidsshownjs, q1C24cardidsshownjs, q1C25cardidsshownjs, q1C26cardidsshownjs]

-- The end of the footer of the deck has the name of the deck and the names of all the subdecks as an array.
deck1cfooter2string = "var Q1Call = [" ++ subdecklistshown ++ "];"
   where subdecklistshown = intercalate "," qtaglist 
         qtaglist = map qtag [1..26]
         qtag inpnum = if inpnum < 10 then "Q1C0" ++ show inpnum else "Q1C" ++ show inpnum

-- The output string is made of each subdeck rendered to string plus the footer strings
deckntf31cjsfilestring = concat [subdeck01string, subdeck02string, subdeck03string, subdeck04string, subdeck05string, subdeck06string, subdeck07string, subdeck08string, subdeck09string, subdeck10string, subdeck11string, subdeck12string, subdeck13string, subdeck14string, subdeck15string, subdeck16string, subdeck17string, subdeck18string, subdeck19string, subdeck20string, subdeck21string, subdeck22string, subdeck23string, subdeck24string, subdeck25string, subdeck26string, deck1cfooter1string, "\n", deck1cfooter2string]

-- main is the singular IO operation, which
-- takes the whole deck rendered to a string and writes it as a .js file
-- containing each card's name, terminal text, and answer,
-- each subdeck's list of cards, and the whole deck's list of subdecks.
main = writeFile "deck_ntf3_1c.js" deckntf31cjsfilestring
