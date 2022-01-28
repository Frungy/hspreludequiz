module Deckmakerhelpers where

import Data.List(intercalate, zipWith4)
import Text.Printf(printf)

-- Some utilities that probably have better names that I can't remember right now.
show2digits inpnum = if inpnum >= 10 then show inpnum else "0" ++ show inpnum
showlastindex inpnum = if inpnum >= 100 then show inpnum else (if inpnum >= 10 then "0" ++ show inpnum else "00" ++ show inpnum)
dropE inpnum inpstr = take (length inpstr - inpnum) inpstr

roundn numdec inpfloat = (fromInteger $ round $ inpfloat * (10 ^ numdec)) / (10.0 ^^ numdec)

showwut3 inpfloat = reverse $ dropWhile (=='0') $ reverse ((printf "%.3f" inpfloat) :: String)

succn inpnum = foldl1 (.) (replicate inpnum succ)
predn inpnum = foldl1 (.) (replicate inpnum pred)

-- This is the function for outputting a JavaScript var declaraction for a card with the following information:
-- card ID, description for description modes, minimal example for minimal example modes, and answer.
-- text for minimal example will have abbreviated color tags.  text for description modes doesn't contain any color tags.
writejscard cardid description minext answer = concat ["var ", cardid, " = new cardtypex01(\n   \"", description, "\"\n   ,\"", minext, "\"\n   ,\"", answer, "\");\n\n"]

-- This is the function for outputting a subdeck of cards given lists for card ids, descriptions (for descriptions modes), minimal examples (for minimal examples modes), and answers for each card.
writejssubdeckstring cardids descriptions minextlist answers = concat $ zipWith4 writejscard cardids descriptions minextlist answers

-- These are functions for showing strings and characters escaped, by writing definitions double-escaped.
showstrwithescapes inpstr   = concat ["\\\"", inpstr, "\\\""]
showcharwithescapes inpchar = concat ["\\\'", [inpchar], "\\\'"]

-- These functions are for showing things with colors and escape characters so that when they're passed to HTML as the content of a text, the different words will be in the right colors and characters that need to be escaped will be.
showcharwithescapesandcolor     inpchar = htmlcolor4 $ showcharwithescapes inpchar
showghcitextwithcolor            inpstr = htmlcolor1 inpstr
showmischswithcolor              inpval = htmlcolor2 $ show inpval
showmhlistwithcolor             inplist = concat [opensquarewithcolor, intercalate commawithcolor $ map showmischswithcolor inplist, closesquarewithcolor]
shownumlistwithcolors           inplist = concat [opensquarewithcolor, intercalate commawithcolor $ map shownumwithcolor inplist, closesquarewithcolor]
shownumlistlistwithcolors   inplistlist = concat [opensquarewithcolor, intercalate commawithcolor $ map shownumlistwithcolors inplistlist, closesquarewithcolor]
shownumwithcolor                 inpnum = htmlcolor4 $ show inpnum
showrangewithcolors     inpnum1 inpnum2 = concat [opensquarewithcolor, shownumwithcolor inpnum1, htmlcolor6 "..", shownumwithcolor inpnum2, closesquarewithcolor]
showstrwithescapesandcolor       inpstr = htmlcolor5 $ showstrwithescapes inpstr
showstrlistwithescapesandcolors inplist = concat [opensquarewithcolor, intercalate commawithcolor $ map showstrwithescapesandcolor inplist, closesquarewithcolor]
showtermcommentwithcolor prompt comment = showghcitextwithcolor prompt ++ htmlcolor3 comment

-- p1(num,num), p2(char,char), p3(numlist,numlist), p4(string,string), p5(num,char), p6(num,numlist), p7(num,string), p8(char,num), p9(char,numlist), pa(char,string), pb(numlist,num), pc(numlist,char), pd(numlist,string), pe(string,num), pf(string,char), pg(string,numlist)
showp1withcolors           (inpnum1,  inpnum2)  = concat [openparenwithcolor, shownumwithcolor inpnum1,             commawithcolor, shownumwithcolor inpnum2,             closeparenwithcolor]
showp2withescapesandcolors (inpchar1, inpchar2) = concat [openparenwithcolor, showcharwithescapesandcolor inpchar1, commawithcolor, showcharwithescapesandcolor inpchar2, closeparenwithcolor]
showp3withcolors           (inpnl1,   inpnl2)   = concat [openparenwithcolor, shownumlistwithcolors inpnl1,         commawithcolor, shownumlistwithcolors inpnl2,         closeparenwithcolor]
showp4withescapesandcolors (inpstr1,  inpstr2)  = concat [openparenwithcolor, showstrwithescapesandcolor inpstr1,   commawithcolor, showstrwithescapesandcolor inpstr2,   closeparenwithcolor]
showp5withescapesandcolors (inpnum,   inpchar)  = concat [openparenwithcolor, shownumwithcolor inpnum,              commawithcolor, showcharwithescapesandcolor inpchar,  closeparenwithcolor]
showp6withcolors           (inpnum,   inpnl)    = concat [openparenwithcolor, shownumwithcolor inpnum,              commawithcolor, shownumlistwithcolors inpnl,          closeparenwithcolor]
showp7withescapesandcolors (inpnum,   inpstr)   = concat [openparenwithcolor, shownumwithcolor inpnum,              commawithcolor, showstrwithescapesandcolor inpstr,    closeparenwithcolor]
showp8withescapesandcolors (inpchar,  inpnum)   = concat [openparenwithcolor, showcharwithescapesandcolor inpchar,  commawithcolor, shownumwithcolor inpnum,              closeparenwithcolor]
showp9withescapesandcolors (inpchar,  inpnl)    = concat [openparenwithcolor, showcharwithescapesandcolor inpchar,  commawithcolor, shownumlistwithcolors inpnl,          closeparenwithcolor]
showpawithescapesandcolors (inpchar,  inpstr)   = concat [openparenwithcolor, showcharwithescapesandcolor inpchar,  commawithcolor, showstrwithescapesandcolor inpstr,    closeparenwithcolor]
showpbwithcolors           (inpnl,    inpnum)   = concat [openparenwithcolor, shownumlistwithcolors inpnl,          commawithcolor, shownumwithcolor inpnum,              closeparenwithcolor]
showpcwithescapesandcolors (inpnl,    inpchar)  = concat [openparenwithcolor, shownumlistwithcolors inpnl,          commawithcolor, showcharwithescapesandcolor inpchar,  closeparenwithcolor]
showpdwithescapesandcolors (inpnl,    inpstr)   = concat [openparenwithcolor, shownumlistwithcolors inpnl,          commawithcolor, showstrwithescapesandcolor inpstr,    closeparenwithcolor]
showpewithescapesandcolors (inpstr,   inpnum)   = concat [openparenwithcolor, showstrwithescapesandcolor inpstr,    commawithcolor, shownumwithcolor inpnum,              closeparenwithcolor]
showpfwithescapesandcolors (inpstr,   inpchar)  = concat [openparenwithcolor, showstrwithescapesandcolor inpstr,    commawithcolor, showcharwithescapesandcolor inpchar,  closeparenwithcolor]
showpgwithescapesandcolors (inpstr,   inpnl)    = concat [openparenwithcolor, showstrwithescapesandcolor inpstr,    commawithcolor, shownumlistwithcolors inpnl,          closeparenwithcolor]

-- These are for showing predicates of equal or not equal to a char or num with all the right colors in html tags.
showequalpredicatetocharwithcolors    inpchar = concat [openparenwithcolor, doubleequalswithcolor', charwithsinglequoteswithcolor inpchar, closeparenwithcolor]
shownotequalpredicatetocharwithcolors inpchar = concat [openparenwithcolor, notequalwithcolor', charwithsinglequoteswithcolor inpchar, closeparenwithcolor]
charwithsinglequoteswithcolor         inpchar = htmlcolor4 $ concat ["\'", [inpchar], "\'"]
showequalpredicatetonumwithcolors      inpnum = concat [openparenwithcolor, doubleequalswithcolor', shownumwithcolor inpnum, closeparenwithcolor]
shownotequalpredicatetonumwithcolors   inpnum = concat [openparenwithcolor, notequalwithcolor', shownumwithcolor inpnum, closeparenwithcolor]
showgthannumwithcolors                 inpnum = concat [openparenwithcolor, htmlcolor6 "&gt;", shownumwithcolor inpnum, closeparenwithcolor]
showlthannumwithcolors                 inpnum = concat [openparenwithcolor, htmlcolor6 "&lt;", shownumwithcolor inpnum, closeparenwithcolor]
showgthancharwithcolors               inpchar = concat [openparenwithcolor, htmlcolor6 "&gt;", showcharwithescapesandcolor inpchar, closeparenwithcolor]
showlthancharwithcolors               inpchar = concat [openparenwithcolor, htmlcolor6 "&lt;", showcharwithescapesandcolor inpchar, closeparenwithcolor]

-- These return a pair where fst is a predicate of equal or not equal to a char or num and snd is a display of it with all the right colors in html tags.
predequalcharpair inpchar = ((== inpchar), showequalpredicatetocharwithcolors inpchar)
prednotequalcharpair inpchar = ((/= inpchar), shownotequalpredicatetocharwithcolors inpchar)
predequalnumpair inpnum = ((== inpnum), showequalpredicatetonumwithcolors inpnum)
prednotequalnumpair inpnum = ((/= inpnum), shownotequalpredicatetonumwithcolors inpnum)

-- Applying tags for colors to the text.  The HTML opening tags for colors are abbreviated.
-- When the JavaScript is running, the tags are expanded to tag up different colors as different classes.
htmlcolor inpstring inpnum = concat ["<", show2digits inpnum, ">", inpstring, "</span>"]
htmlcolor1 inpstr = htmlcolor inpstr 1
htmlcolor2 inpstr = htmlcolor inpstr 2
htmlcolor3 inpstr = htmlcolor inpstr 3
htmlcolor4 inpstr = htmlcolor inpstr 4
htmlcolor5 inpstr = htmlcolor inpstr 5
htmlcolor6 inpstr = htmlcolor inpstr 6

-- Some convenience names for colored commonly used blocks of text.
alphabetlc = ['a'..'z']
ansind = "->ANSWER<-"
infixansind = htmlcolor6 "->ANSWER<-"
space = " "
newline = "<br>"
termopen1 = concat [prelprompt, space, htmlcolor2 ansind, space]
prelprompt = htmlcolor1 "Prelude> "
emptystringwithescapesandcolor = htmlcolor5 "\\\"\\\""
emptylistwithcolor    = htmlcolor2 "[]"
truevaluewithcolor    = htmlcolor2 "True"
falsevaluewithcolor   = htmlcolor2 "False"
openparenwithcolor    = htmlcolor2 "("
closeparenwithcolor   = htmlcolor2 ")"
opensquarewithcolor   = htmlcolor2 "["
closesquarewithcolor  = htmlcolor2 "]"
commawithcolor    = htmlcolor2 ","
doubleequalswithcolor = htmlcolor6 "=="
doubleequalswithcolor' = htmlcolor6 "== "
notequalwithcolor = htmlcolor6 "/="
notequalwithcolor' = htmlcolor6 "/= "
fourdotwithcolor = htmlcolor6 "::"
continuedsuffix   = htmlcolor1 "... (continues until interrupted)"
continuedsuffix'  = commawithcolor ++ continuedsuffix

-- This is where a good portion of the magic happens.  These are the "minimal example text maker" functions.  There's one for each type signature required.
-- Example use: minextmakernltonl is for a function from a list of numbers to a list a numbers.
-- You could pass that one the 'init' or 'tail' function and a list of numbers and it will compute the result of doing that function to that input,
-- and this function will determine the exact string to be written as the minextext (minimal example text) property of the card in the JavaScript.
-- Which is the HTML that's passed to the HTML element to display to the simulated terminal onscreen in the game.
-- In order for that terminal text to have different colors for different word types, the HTML is given span tags with different classes for different colors.
-- A list of numbers needs a <span class="colornumberxxthings"> and a </span> to surround each comma and each number, since commas and numbers show up in alternating colors.
-- That's why a lot of magic has to happen here.  By the time things come out of these functions, anything with a number list is (and many other things are) an unwieldy mass of tags by then.
-- Take the words after 'concat' in the definition of minextmakernltonl.  termopen1 means it starts with the standard terminal opener, which is "Prelude> " in color 1, then " -> ANSWER <- " in color 2,
-- (which gets replaced in live-updated fashion when the user types), then the input number list is shown with colors appropriate for displaying a list of numbers,
-- (color 2 for brackets and commas, color 4 for numbers), then on the next line of the onscreen is shown the list that results from passing the input list to the input function,
-- also displayed with colors appropriate for displaying a list of numbers, and then on the next line of the onscreen is shown the ending prompt "Prelude> " in color 1.
-- Once one of these functions is defined for a type signature*, next time you have to make a subdeck of minimal examples and the next function happens to have the same type signature as an earlier one,
-- all you have to do is define the banks of inputs and do a few other quick things and your subdeck maker for that word is made.
-- Well, if you have a function with the same type signature as an eariler one, but the story of the minimal example is a different series of prompts and functions and values,
-- then you'll have to define a new one of these or combine existing ones.
-- ch = char, mh = misc Haskell word, nl = number list, nm = number list list, np = number list pair, nu = number, sl = string list, sp = string pair, st = string
-- misc Haskell word means something to show up with the same color as a function name or the word True.

-- char and to char
minextmakerchtoch fi in1     = concat [termopen1, showcharwithescapesandcolor in1, newline, showcharwithescapesandcolor $ fi in1, newline, prelprompt]
-- char and char to misc hs word
minextmakerchchtomh fi in1 in2 = concat [termopen1, showcharwithescapesandcolor in1, space, showcharwithescapesandcolor in2, newline, showmischswithcolor $ fi in1 in2, newline, prelprompt]
-- char and number to char
minextmakerchnutoch fi in1 in2 = concat [termopen1, showcharwithescapesandcolor in1, space, shownumwithcolor in2, newline, showcharwithescapesandcolor $ fi in1 in2, newline, prelprompt]
-- char and string to misc hs word
minextmakerchsttomh fi in1 in2 = concat [termopen1, showcharwithescapesandcolor in1, space, showstrwithescapesandcolor in2, newline, showmischswithcolor $ fi in1 in2, newline, prelprompt]

-- function and numlist to numlist.  in1 is the input function in1sc is a string for showing the function in html.  in1sc must have colors applied before being sent to this function.
minextmakerfnnltonl fi in1 in1sc in2 = concat [termopen1, in1sc, space, shownumlistwithcolors in2, newline, shownumlistwithcolors $ fi in1 in2, newline, prelprompt]
-- function and numlist to numlist.  in1 is the input function in1sc is a string for showing the function in html.  in1sc must have colors applied before being sent to this function.
minextmakerfnnltop3 fi in1 in1sc in2 = concat [termopen1, in1sc, space, shownumlistwithcolors in2, newline, showp3withcolors $ fi in1 in2, newline, prelprompt]
-- function and string to string.  in1 is the input function in1sc is a string for showing the function in html.  in1sc must have colors applied before being sent to this function.
minextmakerfnsttost fi in1 in1sc in2 = concat [termopen1, in1sc, space, showstrwithescapesandcolor in2, newline, showstrwithescapesandcolor $ fi in1 in2, newline, prelprompt]
-- function and string to string.  in1 is the input function in1sc is a string for showing the function in html.  in1sc must have colors applied before being sent to this function.
minextmakerfnsttop4 fi in1 in1sc in2 = concat [termopen1, in1sc, space, showstrwithescapesandcolor in2, newline, showp4withescapesandcolors $ fi in1 in2, newline, prelprompt]

-- misc hs to misc hs
minextmakermhtomh fi in1       = concat [termopen1, showmischswithcolor in1, newline, showmischswithcolor $ fi in1, newline, prelprompt]

-- misc hs and misc hs to misc hs
minextmakermhmhtomh fi in1 in2 = concat [termopen1, showmischswithcolor in1, space, showmischswithcolor in2, newline, showmischswithcolor $ fi in1 in2, newline, prelprompt]

-- misc hs list to misc hs
minextmakermltomh fi in1       = concat [termopen1, showmhlistwithcolor in1, newline, showmischswithcolor $ fi in1, newline, prelprompt]

-- number to misc hs
minextmakernutomh   fi in1     = concat [termopen1, shownumwithcolor in1, newline, showmischswithcolor $ fi in1, newline, prelprompt]
-- number to number
minextmakernutonu   fi in1     = concat [termopen1, shownumwithcolor in1, newline, shownumwithcolor $ fi in1, newline, prelprompt]
-- number to string
minextmakernutost   fi in1     = concat [termopen1, shownumwithcolor in1, newline, showstrwithescapesandcolor $ fi in1, newline, prelprompt]
-- number to number, rounded
minextmakernutonur   fi in1    = concat [termopen1, htmlcolor4 ((printf "%.3f" in1) :: String), newline, htmlcolor4 ((printf "%.3f" (fi in1)) :: String), newline, prelprompt]
-- number and char to number
minextmakernuchtonu fi in1 in2 = concat [termopen1, shownumwithcolor in1, space, showcharwithescapesandcolor in2, newline, shownumwithcolor $ fi in1 in2, newline, prelprompt]
-- number and char to string
minextmakernuchtost fi in1 in2 = concat [termopen1, shownumwithcolor in1, space, showcharwithescapesandcolor in2, newline, showstrwithescapesandcolor $ fi in1 in2, newline, prelprompt]
-- number and number to misc hs
minextmakernunutomh fi in1 in2 = concat [termopen1, shownumwithcolor in1, space, shownumwithcolor in2, newline, showmischswithcolor $ fi in1 in2, newline, prelprompt]
-- number and number to number
minextmakernunutonu fi in1 in2 = concat [termopen1, shownumwithcolor in1, space, shownumwithcolor in2, newline, shownumwithcolor $ fi in1 in2, newline, prelprompt]
-- number and number to number, rounded
minextmakernunutonur fi in1 in2 = concat [termopen1, shownumwithcolor (round in1), space, shownumwithcolor (round in2), newline, htmlcolor4 ((printf "%.3f" (fi in1 in2)) :: String), newline, prelprompt]
-- number and number to numlist
minextmakernunutonl fi in1 in2 = concat [termopen1, shownumwithcolor in1, space, shownumwithcolor in2, newline, shownumlistwithcolors $ fi in1 in2, newline, prelprompt]
-- number and numlist to misc hs
minextmakernunltomh fi in1 in2 = concat [termopen1, shownumwithcolor in1, space, shownumlistwithcolors in2, newline, showmischswithcolor $ fi in1 in2, newline, prelprompt]
-- number and numlist to numlist
minextmakernunltonl fi in1 in2 = concat [termopen1, shownumwithcolor in1, space, shownumlistwithcolors in2, newline, shownumlistwithcolors $ fi in1 in2, newline, prelprompt]
-- number and numlist to numlistlist
minextmakernunltonm fi in1 in2 = concat [termopen1, shownumwithcolor in1, space, shownumlistwithcolors in2, newline, shownumlistlistwithcolors $ fi in1 in2, newline, prelprompt]
-- number and numlist to num list pair
minextmakernunltonp fi in1 in2 = let (oplist1,oplist2) = fi in1 in2 in concat [termopen1, shownumwithcolor in1, space, shownumlistwithcolors in2, newline, concat [openparenwithcolor, shownumlistwithcolors oplist1, commawithcolor, shownumlistwithcolors oplist2, closeparenwithcolor], newline, prelprompt]
-- number and string to number
minextmakernusttonu fi in1 in2 = concat [termopen1, shownumwithcolor in1, space, showstrwithescapesandcolor in2, newline, shownumwithcolor $ fi in1 in2, newline, prelprompt]
-- number and string to string
minextmakernusttost fi in1 in2 = concat [termopen1, shownumwithcolor in1, space, showstrwithescapesandcolor in2, newline, showstrwithescapesandcolor $ fi in1 in2, newline, prelprompt]
-- number and string to string list
minextmakernusttosl fi in1 in2 = concat [termopen1, shownumwithcolor in1, space, showstrwithescapesandcolor in2, newline, showstrlistwithescapesandcolors $ fi in1 in2, newline, prelprompt]
-- number and string to string pair
minextmakernusttosp fi in1 in2 = let (opstr1,opstr2) = fi in1 in2 in concat [termopen1, shownumwithcolor in1, space, showstrwithescapesandcolor in2, newline, concat [openparenwithcolor, showstrwithescapesandcolor opstr1, commawithcolor, showstrwithescapesandcolor opstr2, closeparenwithcolor], newline, prelprompt]

-- numlist to numlist
minextmakernltonl    fi in1    = concat [termopen1, shownumlistwithcolors in1, newline, shownumlistwithcolors $ fi in1, newline, prelprompt]
-- numlist to number
minextmakernltonu    fi in1    = concat [termopen1, shownumlistwithcolors in1, newline, shownumwithcolor $ fi in1, newline, prelprompt]
-- numlist to string
minextmakernltost    fi in1    = concat [termopen1, shownumlistwithcolors in1, newline, showstrwithescapesandcolor $ fi in1, newline, prelprompt]
-- numlist and string to numlist
minextmakernlsttonl fi in1 in2 = concat [termopen1, shownumlistwithcolors in1, space, showstrwithescapesandcolor in2, newline, shownumlistwithcolors $ fi in1 in2, newline, prelprompt]

-- numlistlist to numlist
minextmakernmtonl    fi in1    = concat [termopen1, shownumlistlistwithcolors in1, newline, shownumlistwithcolors $ fi in1, newline, prelprompt]

-- p1(num,num), p2(char,char), p3(numlist,numlist), p4(string,string), p5(num,char), p6(num,numlist), p7(num,string), p8(char,num), p9(char,numlist), pa(char,string), pb(numlist,num), pc(numlist,char), pd(numlist,string), pe(string,num), pf(string,char), pg(string,numlist)
-- (num,num) to num
minextmakerp1tonu   fi in1     = concat [termopen1, showp1withcolors in1, newline, shownumwithcolor $ fi in1, newline, prelprompt]
-- (num,num) to str
minextmakerp1tost   fi in1     = concat [termopen1, showp1withcolors in1, newline, showstrwithescapesandcolor $ fi in1, newline, prelprompt]
-- (char,char) to char
minextmakerp2toch   fi in1     = concat [termopen1, showp2withescapesandcolors in1, newline, showcharwithescapesandcolor $ fi in1, newline, prelprompt]
-- (numlist,numlist) to numlist
minextmakerp3tonl   fi in1     = concat [termopen1, showp3withcolors in1, newline, shownumlistwithcolors $ fi in1, newline, prelprompt]
-- (string,string) to string
minextmakerp4tost   fi in1     = concat [termopen1, showp4withescapesandcolors in1, newline, showstrwithescapesandcolor $ fi in1, newline, prelprompt]
-- (num,char) to char
minextmakerp5toch   fi in1     = concat [termopen1, showp5withescapesandcolors in1, newline, showcharwithescapesandcolor $ fi in1, newline, prelprompt]
-- (num,char) to num
minextmakerp5tonu   fi in1     = concat [termopen1, showp5withescapesandcolors in1, newline, shownumwithcolor $ fi in1, newline, prelprompt]
-- (num,numlist) to num
minextmakerp6tonu   fi in1     = concat [termopen1, showp6withcolors in1, newline, shownumwithcolor $ fi in1, newline, prelprompt]
-- (num,numlist) to numlist
minextmakerp6tonl   fi in1     = concat [termopen1, showp6withcolors in1, newline, shownumlistwithcolors $ fi in1, newline, prelprompt]
-- (num,string) to num
minextmakerp7tonu   fi in1     = concat [termopen1, showp7withescapesandcolors in1, newline, shownumwithcolor $ fi in1, newline, prelprompt]
-- (num,string) to string
minextmakerp7tost   fi in1     = concat [termopen1, showp7withescapesandcolors in1, newline, showstrwithescapesandcolor $ fi in1, newline, prelprompt]
-- (char,num) to char
minextmakerp8toch   fi in1     = concat [termopen1, showp8withescapesandcolors in1, newline, showcharwithescapesandcolor $ fi in1, newline, prelprompt]
-- (char,num) to num
minextmakerp8tonu   fi in1     = concat [termopen1, showp8withescapesandcolors in1, newline, shownumwithcolor $ fi in1, newline, prelprompt]
-- (char,numlist) to char
minextmakerp9toch   fi in1     = concat [termopen1, showp9withescapesandcolors in1, newline, showcharwithescapesandcolor $ fi in1, newline, prelprompt]
-- (char,numlist) to numlist
minextmakerp9tonl   fi in1     = concat [termopen1, showp9withescapesandcolors in1, newline, shownumlistwithcolors $ fi in1, newline, prelprompt]
-- (char,string) to char
minextmakerpatoch   fi in1     = concat [termopen1, showpawithescapesandcolors in1, newline, showcharwithescapesandcolor $ fi in1, newline, prelprompt]
-- (char,string) to string
minextmakerpatost   fi in1     = concat [termopen1, showpawithescapesandcolors in1, newline, showstrwithescapesandcolor $ fi in1, newline, prelprompt]
-- (numlist,num) to num
minextmakerpbtonu   fi in1     = concat [termopen1, showpbwithcolors in1, newline, shownumwithcolor $ fi in1, newline, prelprompt]
-- (numlist,num) to numlist
minextmakerpbtonl   fi in1     = concat [termopen1, showpbwithcolors in1, newline, shownumlistwithcolors $ fi in1, newline, prelprompt]
-- (numlist,char) to char
minextmakerpctoch   fi in1     = concat [termopen1, showpcwithescapesandcolors in1, newline, showcharwithescapesandcolor $ fi in1, newline, prelprompt]
-- (numlist,char) to numlist
minextmakerpctonl   fi in1     = concat [termopen1, showpcwithescapesandcolors in1, newline, shownumlistwithcolors $ fi in1, newline, prelprompt]
-- (numlist,string) to numlist
minextmakerpdtonl   fi in1     = concat [termopen1, showpdwithescapesandcolors in1, newline, shownumlistwithcolors $ fi in1, newline, prelprompt]
-- (numlist,string) to string
minextmakerpdtost   fi in1     = concat [termopen1, showpdwithescapesandcolors in1, newline, showstrwithescapesandcolor $ fi in1, newline, prelprompt]
-- (string,num) to num
minextmakerpetonu   fi in1     = concat [termopen1, showpewithescapesandcolors in1, newline, shownumwithcolor $ fi in1, newline, prelprompt]
-- (string,num) to string
minextmakerpetost   fi in1     = concat [termopen1, showpewithescapesandcolors in1, newline, showstrwithescapesandcolor $ fi in1, newline, prelprompt]
-- (string,char) to char
minextmakerpftoch   fi in1     = concat [termopen1, showpfwithescapesandcolors in1, newline, showcharwithescapesandcolor $ fi in1, newline, prelprompt]
-- (string,char) to string
minextmakerpftost   fi in1     = concat [termopen1, showpfwithescapesandcolors in1, newline, showstrwithescapesandcolor $ fi in1, newline, prelprompt]
-- (string,numlist) to numlist
minextmakerpgtonl   fi in1     = concat [termopen1, showpgwithescapesandcolors in1, newline, shownumlistwithcolors $ fi in1, newline, prelprompt]
-- (string,numlist) to string
minextmakerpgtost   fi in1     = concat [termopen1, showpgwithescapesandcolors in1, newline, showstrwithescapesandcolor $ fi in1, newline, prelprompt]

-- string to char
minextmakersttoch   fi in1     = concat [termopen1, showstrwithescapesandcolor in1, newline, showcharwithescapesandcolor $ fi in1, newline, prelprompt]
-- string to number
minextmakersttonu   fi in1     = concat [termopen1, showstrwithescapesandcolor in1, newline, shownumwithcolor $ fi in1, newline, prelprompt]
-- string to string
minextmakersttost   fi in1     = concat [termopen1, showstrwithescapesandcolor in1, newline, showstrwithescapesandcolor $ fi in1, newline, prelprompt]
-- string to string list
minextmakersttosl   fi in1     = concat [termopen1, showstrwithescapesandcolor in1, newline, showstrlistwithescapesandcolors $ fi in1, newline, prelprompt]
-- string and number to string
minextmakerstnutost fi in1 in2 = concat [termopen1, showstrwithescapesandcolor in1, space, shownumwithcolor in2, newline, showstrwithescapesandcolor $ fi in1 in2, newline, prelprompt]
-- string and numlist to string
minextmakerstnltost fi in1 in2 = concat [termopen1, showstrwithescapesandcolor in1, space, shownumlistwithcolors in2, newline, showstrwithescapesandcolor $ fi in1 in2, newline, prelprompt]
-- string and string to string
minextmakerststtost fi in1 in2 = concat [termopen1, showstrwithescapesandcolor in1, space, showstrwithescapesandcolor in2, newline, showstrwithescapesandcolor $ fi in1 in2, newline, prelprompt]

-- string list to string
minextmakersltost   fi in1     = concat [termopen1, showstrlistwithescapesandcolors in1, newline, showstrwithescapesandcolor $ fi in1, newline, prelprompt]


-- char to char, sans end prompt
minextmakerchtoch' fi in1     = concat [termopen1, showcharwithescapesandcolor in1, newline, showcharwithescapesandcolor $ fi in1]
-- char and char to misc hs word, sans end prompt
minextmakerchchtomh' fi in1 in2 = concat [termopen1, showcharwithescapesandcolor in1, space, showcharwithescapesandcolor in2, newline, showmischswithcolor $ fi in1 in2]
-- char and number to char, sans end prompt
minextmakerchnutoch' fi in1 in2 = concat [termopen1, showcharwithescapesandcolor in1, space, shownumwithcolor in2, newline, showcharwithescapesandcolor $ fi in1 in2]
-- char and string to misc hs word, sans end prompt
minextmakerchsttomh' fi in1 in2 = concat [termopen1, showcharwithescapesandcolor in1, space, showstrwithescapesandcolor in2, newline, showmischswithcolor $ fi in1 in2]

-- function and numlist to numlist, sans end prompt.  in1 is the input function in1sc is a string for showing the function in html.  in1sc must have colors applied before being sent to this function.
minextmakerfnnltonl' fi in1 in1sc in2 = concat [termopen1, in1sc, space, shownumlistwithcolors in2, newline, shownumlistwithcolors $ fi in1 in2]
-- function and string to string, sans end prompt.  in1 is the input function in1sc is a string for showing the function in html.  in1sc must have colors applied before being sent to this function.
minextmakerfnsttost' fi in1 in1sc in2 = concat [termopen1, in1sc, space, showstrwithescapesandcolor in2, newline, showstrwithescapesandcolor $ fi in1 in2]

-- misc hs and misc hs to misc hs, sans end prompt
minextmakermhmhtomh' fi in1 in2 = concat [termopen1, showmischswithcolor in1, space, showmischswithcolor in2, newline, showmischswithcolor $ fi in1 in2]

-- misc hs list to misc hs, sans end prompt
minextmakermltomh' fi in1       = concat [termopen1, showmhlistwithcolor in1, newline, showmischswithcolor $ fi in1]

-- number to misc hs, sans end prompt
minextmakernutomh' fi in1 = concat [termopen1, shownumwithcolor in1, newline, showmischswithcolor $ fi in1]
-- number to number, sans end prompt
minextmakernutonu' fi in1 = concat [termopen1, shownumwithcolor in1, newline, shownumwithcolor $ fi in1]
-- number and char to number, sans end prompt
minextmakernuchtonu' fi in1 in2 = concat [termopen1, shownumwithcolor in1, space, showcharwithescapesandcolor in2, newline, shownumwithcolor $ fi in1 in2]
-- number and char to string, sans end prompt
minextmakernuchtost' fi in1 in2 = concat [termopen1, shownumwithcolor in1, space, showcharwithescapesandcolor in2, newline, showstrwithescapesandcolor $ fi in1 in2]
-- number and number to number, sans end prompt
minextmakernunutonu' fi in1 in2 = concat [termopen1, shownumwithcolor in1, space, shownumwithcolor in2, newline, shownumwithcolor $ fi in1 in2]
-- number and number to numlist, sans end prompt
minextmakernunutonl' fi in1 in2 = concat [termopen1, shownumwithcolor in1, space, shownumwithcolor in2, newline, shownumlistwithcolors $ fi in1 in2]
-- number and numlist to misc hs, sans end prompt
minextmakernunltomh' fi in1 in2 = concat [termopen1, shownumwithcolor in1, space, shownumlistwithcolors in2, newline, showmischswithcolor $ fi in1 in2]
-- number and numlist to numlist, sans end prompt
minextmakernunltonl' fi in1 in2 = concat [termopen1, shownumwithcolor in1, space, shownumlistwithcolors in2, newline, shownumlistwithcolors $ fi in1 in2]
-- number and numlist to numlistlist, sans end prompt
minextmakernunltonm' fi in1 in2 = concat [termopen1, shownumwithcolor in1, space, shownumlistwithcolors in2, newline, shownumlistlistwithcolors $ fi in1 in2]
-- number and numlist to num list pair, sans end prompt
minextmakernunltonp' fi in1 in2 = let (oplist1,oplist2) = fi in1 in2 in concat [termopen1, shownumwithcolor in1, space, shownumlistwithcolors in2, newline, concat [openparenwithcolor, shownumlistwithcolors oplist1, commawithcolor, shownumlistwithcolors oplist2, closeparenwithcolor]]
-- number and string to number, sans end prompt
minextmakernusttonu' fi in1 in2 = concat [termopen1, shownumwithcolor in1, space, showstrwithescapesandcolor in2, newline, shownumwithcolor $ fi in1 in2]
-- number and string to string, sans end prompt
minextmakernusttost' fi in1 in2 = concat [termopen1, shownumwithcolor in1, space, showstrwithescapesandcolor in2, newline, showstrwithescapesandcolor $ fi in1 in2]
-- number and string to string list, sans end prompt
minextmakernusttosl' fi in1 in2 = concat [termopen1, shownumwithcolor in1, space, showstrwithescapesandcolor in2, newline, showstrlistwithescapesandcolors $ fi in1 in2]
-- number and string to string pair, sans end prompt
minextmakernusttosp' fi in1 in2 = let (opstr1,opstr2) = fi in1 in2 in concat [termopen1, shownumwithcolor in1, space, showstrwithescapesandcolor in2, newline, concat [openparenwithcolor, showstrwithescapesandcolor opstr1, commawithcolor, showstrwithescapesandcolor opstr2, closeparenwithcolor]]

-- numlist to numlist, sans end prompt
minextmakernltonl'    fi in1    = concat [termopen1, shownumlistwithcolors in1, newline, shownumlistwithcolors $ fi in1]
-- numlist to number, sans end prompt
minextmakernltonu'    fi in1    = concat [termopen1, shownumlistwithcolors in1, newline, shownumwithcolor $ fi in1]
-- numlist and string to numlist, sans end prompt
minextmakernlsttonl' fi in1 in2 = concat [termopen1, shownumlistwithcolors in1, space, showstrwithescapesandcolor in2, newline, shownumlistwithcolors $ fi in1 in2]

-- numlistlist to numlist, sans end prompt
minextmakernmtonl'    fi in1    = concat [termopen1, shownumlistlistwithcolors in1, newline, shownumlistwithcolors $ fi in1]

-- p1=(num,num), p2=(char,char), p3(numlist,numlist), p4(string,string)
-- (num,num) to num, sans end prompt
minextmakerp1tonu'   fi in1     = concat [termopen1, showp1withcolors in1, newline, shownumwithcolor $ fi in1]
-- (char,char) to char, sans end prompt
minextmakerp2toch'   fi in1     = concat [termopen1, showp2withescapesandcolors in1, newline, showcharwithescapesandcolor $ fi in1]
-- (numlist,numlist) to numlist, sans end prompt
minextmakerp3tonl'   fi in1     = concat [termopen1, showp3withcolors in1, newline, shownumlistwithcolors $ fi in1]
-- (string,string) to string, sans end prompt
minextmakerp4tost'   fi in1     = concat [termopen1, showp4withescapesandcolors in1, newline, showstrwithescapesandcolor $ fi in1]
-- (num,char) to char, sans end prompt
minextmakerp5toch'   fi in1     = concat [termopen1, showp5withescapesandcolors in1, newline, showcharwithescapesandcolor $ fi in1]
-- (num,char) to num, sans end prompt
minextmakerp5tonu'   fi in1     = concat [termopen1, showp5withescapesandcolors in1, newline, shownumwithcolor $ fi in1]
-- (num,numlist) to num, sans end prompt
minextmakerp6tonu'   fi in1     = concat [termopen1, showp6withcolors in1, newline, shownumwithcolor $ fi in1]
-- (num,numlist) to numlist, sans end prompt
minextmakerp6tonl'   fi in1     = concat [termopen1, showp6withcolors in1, newline, shownumlistwithcolors $ fi in1]
-- (num,string) to num, sans end prompt
minextmakerp7tonu'   fi in1     = concat [termopen1, showp7withescapesandcolors in1, newline, shownumwithcolor $ fi in1]
-- (num,string) to string, sans end prompt
minextmakerp7tost'   fi in1     = concat [termopen1, showp7withescapesandcolors in1, newline, showstrwithescapesandcolor $ fi in1]
-- (char,num) to char, sans end prompt
minextmakerp8toch'   fi in1     = concat [termopen1, showp8withescapesandcolors in1, newline, showcharwithescapesandcolor $ fi in1]
-- (char,num) to num, sans end prompt
minextmakerp8tonu'   fi in1     = concat [termopen1, showp8withescapesandcolors in1, newline, shownumwithcolor $ fi in1]
-- (char,numlist) to char, sans end prompt
minextmakerp9toch'   fi in1     = concat [termopen1, showp9withescapesandcolors in1, newline, showcharwithescapesandcolor $ fi in1]
-- (char,numlist) to numlist, sans end prompt
minextmakerp9tonl'   fi in1     = concat [termopen1, showp9withescapesandcolors in1, newline, shownumlistwithcolors $ fi in1]
-- (char,string) to char, sans end prompt
minextmakerpatoch'   fi in1     = concat [termopen1, showpawithescapesandcolors in1, newline, showcharwithescapesandcolor $ fi in1]
-- (char,string) to string, sans end prompt
minextmakerpatost'   fi in1     = concat [termopen1, showpawithescapesandcolors in1, newline, showstrwithescapesandcolor $ fi in1]
-- (numlist,num) to num, sans end prompt
minextmakerpbtonu'   fi in1     = concat [termopen1, showpbwithcolors in1, newline, shownumwithcolor $ fi in1]
-- (numlist,num) to numlist, sans end prompt
minextmakerpbtonl'   fi in1     = concat [termopen1, showpbwithcolors in1, newline, shownumlistwithcolors $ fi in1]
-- (numlist,char) to char, sans end prompt
minextmakerpctoch'   fi in1     = concat [termopen1, showpcwithescapesandcolors in1, newline, showcharwithescapesandcolor $ fi in1]
-- (numlist,char) to numlist, sans end prompt
minextmakerpctonl'   fi in1     = concat [termopen1, showpcwithescapesandcolors in1, newline, shownumlistwithcolors $ fi in1]
-- (numlist,string) to numlist, sans end prompt
minextmakerpdtonl'   fi in1     = concat [termopen1, showpdwithescapesandcolors in1, newline, shownumlistwithcolors $ fi in1]
-- (numlist,string) to string, sans end prompt
minextmakerpdtost'   fi in1     = concat [termopen1, showpdwithescapesandcolors in1, newline, showstrwithescapesandcolor $ fi in1]
-- (string,num) to num, sans end prompt
minextmakerpetonu'   fi in1     = concat [termopen1, showpewithescapesandcolors in1, newline, shownumwithcolor $ fi in1]
-- (string,num) to string, sans end prompt
minextmakerpetost'   fi in1     = concat [termopen1, showpewithescapesandcolors in1, newline, showstrwithescapesandcolor $ fi in1]
-- (string,char) to char, sans end prompt
minextmakerpftoch'   fi in1     = concat [termopen1, showpfwithescapesandcolors in1, newline, showcharwithescapesandcolor $ fi in1]
-- (string,char) to string, sans end prompt
minextmakerpftost'   fi in1     = concat [termopen1, showpfwithescapesandcolors in1, newline, showstrwithescapesandcolor $ fi in1]
-- (string,numlist) to numlist, sans end prompt
minextmakerpgtonl'   fi in1     = concat [termopen1, showpgwithescapesandcolors in1, newline, shownumlistwithcolors $ fi in1]
-- (string,numlist) to string, sans end prompt
minextmakerpgtost'   fi in1     = concat [termopen1, showpgwithescapesandcolors in1, newline, showstrwithescapesandcolor $ fi in1]

-- string to char, sans end prompt
minextmakersttoch'    fi in1    = concat [termopen1, showstrwithescapesandcolor in1, newline, showcharwithescapesandcolor $ fi in1]
-- string to number, sans end prompt
minextmakersttonu'    fi in1    = concat [termopen1, showstrwithescapesandcolor in1, newline, shownumwithcolor $ fi in1]
-- string to string, sans end prompt
minextmakersttost'    fi in1    = concat [termopen1, showstrwithescapesandcolor in1, newline, showstrwithescapesandcolor $ fi in1]
-- string and number to string, sans end prompt
minextmakerstnutost' fi in1 in2 = concat [termopen1, showstrwithescapesandcolor in1, space, shownumwithcolor in2, newline, showstrwithescapesandcolor $ fi in1 in2]
-- string and numlist to string, sans end prompt
minextmakerstnltost' fi in1 in2 = concat [termopen1, showstrwithescapesandcolor in1, space, shownumlistwithcolors in2, newline, showstrwithescapesandcolor $ fi in1 in2]
-- string and string to string, sans end prompt
minextmakerststtost' fi in1 in2 = concat [termopen1, showstrwithescapesandcolor in1, space, showstrwithescapesandcolor in2, newline, showstrwithescapesandcolor $ fi in1 in2]

-- string list to string, sans end prompt
minextmakersltost'    fi in1    = concat [termopen1, showstrlistwithescapesandcolors in1, newline, showstrwithescapesandcolor $ fi in1]


-- char and char to misc hs, infix function
minextmakerchchtomhi fi in1 in2 = concat [prelprompt, showcharwithescapesandcolor in1, space, infixansind, space, showcharwithescapesandcolor in2, newline, showmischswithcolor $ fi in1 in2, newline, prelprompt]

-- misc hs and misc hs to misc hs, infix function
minextmakermhmhtomhi fi in1 in2 = concat [prelprompt, showmischswithcolor in1, space, infixansind, space, showmischswithcolor in2, newline, showmischswithcolor $ fi in1 in2, newline, prelprompt]

-- number and number to number, infix function
minextmakernunutonui fi in1 in2 = concat [prelprompt, shownumwithcolor in1, space, infixansind, space, shownumwithcolor in2, newline, shownumwithcolor $ fi in1 in2, newline, prelprompt]
-- number and number to misc hs, infix function
minextmakernunutomhi fi in1 in2 = concat [prelprompt, shownumwithcolor in1, space, infixansind, space, shownumwithcolor in2, newline, showmischswithcolor $ fi in1 in2, newline, prelprompt]

-- numlist and number to number, infix function
minextmakernlnutonui fi in1 in2 = concat [prelprompt, shownumlistwithcolors in1, space, infixansind, space, shownumwithcolor in2, newline, shownumwithcolor $ fi in1 in2, newline, prelprompt]
-- numlist and numlist to numlist, infix function
minextmakernlnltonli fi in1 in2 = concat [prelprompt, shownumlistwithcolors in1, space, infixansind, space, shownumlistwithcolors in2, newline, shownumlistwithcolors $ fi in1 in2, newline, prelprompt]

-- string and number to char, infix function
minextmakerstnutochi fi in1 in2 = concat [prelprompt, showstrwithescapesandcolor in1, space, infixansind, space, shownumwithcolor in2, newline, showcharwithescapesandcolor $ fi in1 in2, newline, prelprompt]
-- string and string to string, infix function
minextmakerststtosti fi in1 in2 = concat [prelprompt, showstrwithescapesandcolor in1, space, infixansind, space, showstrwithescapesandcolor in2, newline, showstrwithescapesandcolor $ fi in1 in2, newline, prelprompt]


-- char and char to misc hs, infix function, sans end prompt
minextmakerchchtomhi' fi in1 in2 = concat [prelprompt, showcharwithescapesandcolor in1, space, infixansind, space, showcharwithescapesandcolor in2, newline, showmischswithcolor $ fi in1 in2]

-- misc hs and misc hs to misc hs, infix function, sans end prompt
minextmakermhmhtomhi' fi in1 in2 = concat [prelprompt, showmischswithcolor in1, space, infixansind, space, showmischswithcolor in2, newline, showmischswithcolor $ fi in1 in2]

-- number and number to number, infix function, sans end prompt
minextmakernunutonui' fi in1 in2 = concat [prelprompt, shownumwithcolor in1, space, infixansind, space, shownumwithcolor in2, newline, shownumwithcolor $ fi in1 in2]
-- number and number to misc hs, infix function, sans end prompt
minextmakernunutomhi' fi in1 in2 = concat [prelprompt, shownumwithcolor in1, space, infixansind, space, shownumwithcolor in2, newline, showmischswithcolor $ fi in1 in2]

-- numlist and number to number, infix function, sans end prompt
minextmakernlnutonui' fi in1 in2 = concat [prelprompt, shownumlistwithcolors in1, space, infixansind, space, shownumwithcolor in2, newline, shownumwithcolor $ fi in1 in2]
-- numlist and numlist to numlist, infix function, sans end prompt
minextmakernlnltonli' fi in1 in2 = concat [prelprompt, shownumlistwithcolors in1, space, infixansind, space, shownumlistwithcolors in2, newline, shownumlistwithcolors $ fi in1 in2]

-- string and number to char, infix function, sans end prompt
minextmakerstnutochi' fi in1 in2 = concat [prelprompt, showstrwithescapesandcolor in1, space, infixansind, space, shownumwithcolor in2, newline, showcharwithescapesandcolor $ fi in1 in2]
-- string and string to string, infix function, sans end prompt
minextmakerststtosti' fi in1 in2 = concat [prelprompt, showstrwithescapesandcolor in1, space, infixansind, space, showstrwithescapesandcolor in2, newline, showstrwithescapesandcolor $ fi in1 in2]


-- some words of length 5, 6, 7 which don't happen to have head /= last
samplewords1 = ["insect", "pizza", "orange", "potato", "snake", "carrot", "horse", "beetle", "rabbit", "octopus", "donkey", "cherry", "turtle", "cheese", "pickle", "tiger", "peanut", "pepper", "tomato", "cromulent", "prickly", "fnord", "butttraps", "esquilax", "croggle"]
-- 01=insect, 02=pizza, 03=orange, 04=potato, 05=snake, 06=carrot, 07=horse, 08=beetle, 09=rabbit, 10=octopus, 11=donkey, 12=cherry, 13=turtle, 14=cheese, 15=pickle, 16=tiger, 17=peanut, 18=pepper, 19=tomato, 20=cromulent, 21=prickly, 22=fnord, 23=butttraps, 24=esquilax, 25=croggle"]

-- some lists of single digit numbers length 4, 5, 6, 7 which happen to have head /= last /= length /= minimum /= maximum
samplenumlists1 = [[4,0,2,3,9,8], [4,1,1,7,1,2], [6,9,8,2,8], [4,8,2,3,6,5], [6,8,3,1,5,3,2], [4,5,7,2,9,8], [5,7,9,9,1,2], [1,0,8,6], [5,1,6,3], [5,7,9,2,9,9,3], [2,9,4,0,8], [3,8,8,9,1,7], [5,6,2,3], [8,2,5,0,9,7], [4,0,4,8,6,9,3], [5,7,0,6], [6,2,8,3,6,7,4], [3,4,9,0,1,7,8], [3,9,7,6,1,4], [6,8,2,3,3,0,4], [4,0,5,3,4,1,2], [8,4,9,2,6,5], [4,2,6,8,6], [2,6,8,1,4], [4,5,8,2,8,7]]

samplenumbers1 = [4.0,9.3,2.4,4.4,1.6,8.4,5.5,8.5,8.0,4.9,6.4,2.5,6.8,6.9,6.6,6.5,0.7,4.2,7.9,5.0,2.0,0.1,9.0,4.5,5.4]

samplenumbers2 = [65,28,67,63,73,92,96,27,59,17,75,5,79,74,35,20,45,25,16,29,50,41,80,13,40]

samplenumbers3 = [0.05,0.10..0.95]
