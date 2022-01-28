import Deckmakerhelpers
import Data.List(intercalate)

-- go = main because I like to be able to open the .hs file and then type "go" to make it do the thing.
go = main

subdeck01aminextlist = [ concat [minextmakernutonu' id x, newline, minextmakernutonu id (-x), idduplicatewarning] | x <- [0..9] ]
subdeck01bminextlist = [ minextmakerchtoch id x ++ idduplicatewarning | x <- "qwertyuiop" ]
subdeck01cminextlist = [ minextmakersttost id x ++ idduplicatewarning | x <- take 10 samplewords1 ]
subdeck01dminextlist = [ minextmakernltonl id x ++ idduplicatewarning | x <- take 10 samplenumlists1 ]
subdeck01minextlist  = concat [subdeck01aminextlist, subdeck01bminextlist, subdeck01cminextlist, subdeck01dminextlist]
idduplicatewarning = concat [showtermcommentwithcolor "" "-- (The pure function)", newline, prelprompt]

subdeck02aminextlist = [ concat [ concat [minextmakernutonu' ceiling $ x + y, newline, minextmakernutonu ceiling $ x + z]] | x <- [0, 3, 7], y <- [0.2, 0.3, 0.4], z <- [0.7, 0.8, 0.9] ]
subdeck02bminextlist = [ concat [ concat [minextmakernutonu' ceiling $ x + z, newline, minextmakernutonu ceiling $ x + y]] | x <- [5, 9], y <- [0.1, 0.2, 0.3], z <- [0.6, 0.7, 0.9] ]
subdeck02minextlist  = subdeck02aminextlist ++ subdeck02bminextlist

subdeck03aminextlist = [ concat [ concat [minextmakernutonu' floor $ x + y, newline, minextmakernutonu floor $ x + z]] | x <- [1, 4, 9], y <- [0.1, 0.3, 0.4], z <- [0.6, 0.8, 0.9] ]
subdeck03bminextlist = [ concat [ concat [minextmakernutonu' floor $ x + z, newline, minextmakernutonu floor $ x + y]] | x <- [3, 8], y <- [0.1, 0.2, 0.4], z <- [0.6, 0.7, 0.8] ]
subdeck03minextlist  = subdeck03aminextlist ++ subdeck03bminextlist

subdeck04minextlist  = [ concat [minextmakernunutonu (\x y -> roundn 1 (y - x)) x y] | x <- take 7 $ drop 7 $ samplenumbers1, y <- take 7 $ drop 14 $ samplenumbers1, x /= y ]

subdeck05aminextlist = [ minextmakerp1tonu fst (x1,x2) | x1 <- [3, 5], x2 <- [4, 7] ]
subdeck05bminextlist = [ minextmakerp2toch fst (x1,x2) | x1 <- "fm", x2 <- "uw" ]
subdeck05cminextlist = [ minextmakerp3tonl fst (x1,x2) | x1 <- [[8,7,9], [0,0,1]], x2 <- [[7,8,5], [8,7,4]] ]
subdeck05dminextlist = [ minextmakerp4tost fst (x1,x2) | x1 <- ["croggle", "rabbit"], x2 <- ["cheese", "beetle"] ]
subdeck05eminextlist = [ minextmakerp5tonu fst (x1,x2) | x1 <- [2, 7], x2 <- "kx" ]
subdeck05fminextlist = [ minextmakerp6tonu fst (x1,x2) | x1 <- [0, 4], x2 <- [[0,9,5], [4,5,0]] ]
subdeck05gminextlist = [ minextmakerp7tonu fst (x1,x2) | x1 <- [5, 8], x2 <- ["butttraps", "prickly"] ]
subdeck05hminextlist = [ minextmakerp8toch fst (x1,x2) | x1 <- "ls", x2 <- [7, 8] ]
subdeck05iminextlist = [ minextmakerp9toch fst (x1,x2) | x1 <- "hv", x2 <- [[9,8,1], [0,3,9]] ]
subdeck05jminextlist = [ minextmakerpatoch fst (x1,x2) | x1 <- "on", x2 <- ["peanut", "cherry"] ]
subdeck05kminextlist = [ minextmakerpbtonl fst (x1,x2) | x1 <- [[9,7,8], [2,6,9]], x2 <- [7, 8] ]
subdeck05lminextlist = [ minextmakerpctonl fst (x1,x2) | x1 <- [[0,9,3], [8,8,5]], x2 <- "dr" ]
subdeck05mminextlist = [ minextmakerpdtonl fst (x1,x2) | x1 <- [[6,4,9], [8,7,6]], x2 <- ["carrot", "turtle"] ]
subdeck05nminextlist = [ minextmakerpetost fst (x1,x2) | x1 <- ["horse", "esquilax"], x2 <- [1, 9] ]
subdeck05ominextlist = [ minextmakerpftost fst (x1,x2) | x1 <- ["donkey", "fnord"], x2 <- "jt" ]
subdeck05pminextlist = [ minextmakerpgtost fst (x1,x2) | x1 <- ["potato", "pizza"], x2 <- [[1,6,1], [8,7,2]] ]
subdeck05minextlist  = concat [subdeck05aminextlist, subdeck05bminextlist, subdeck05cminextlist, subdeck05dminextlist, subdeck05eminextlist, subdeck05fminextlist, subdeck05gminextlist, subdeck05hminextlist, subdeck05iminextlist, subdeck05jminextlist, subdeck05kminextlist, subdeck05lminextlist, subdeck05mminextlist, subdeck05nminextlist, subdeck05ominextlist, subdeck05pminextlist]

subdeck06aminextlist = [ minextmakerp1tonu snd (x1,x2) | x1 <- [3, 5], x2 <- [4, 7] ]
subdeck06bminextlist = [ minextmakerp2toch snd (x1,x2) | x1 <- "fm", x2 <- "uw" ]
subdeck06cminextlist = [ minextmakerp3tonl snd (x1,x2) | x1 <- [[8,7,9], [0,0,1]], x2 <- [[7,8,5], [8,7,4]] ]
subdeck06dminextlist = [ minextmakerp4tost snd (x1,x2) | x1 <- ["croggle", "rabbit"], x2 <- ["cheese", "beetle"] ]
subdeck06eminextlist = [ minextmakerp5toch snd (x1,x2) | x1 <- [2, 7], x2 <- "kx" ]
subdeck06fminextlist = [ minextmakerp6tonl snd (x1,x2) | x1 <- [0, 4], x2 <- [[0,9,5], [4,5,0]] ]
subdeck06gminextlist = [ minextmakerp7tost snd (x1,x2) | x1 <- [5, 8], x2 <- ["butttraps", "prickly"] ]
subdeck06hminextlist = [ minextmakerp8tonu snd (x1,x2) | x1 <- "ls", x2 <- [7, 8] ]
subdeck06iminextlist = [ minextmakerp9tonl snd (x1,x2) | x1 <- "hv", x2 <- [[9,8,1], [0,3,9]] ]
subdeck06jminextlist = [ minextmakerpatost snd (x1,x2) | x1 <- "on", x2 <- ["peanut", "cherry"] ]
subdeck06kminextlist = [ minextmakerpbtonu snd (x1,x2) | x1 <- [[9,7,8], [2,6,9]], x2 <- [7, 8] ]
subdeck06lminextlist = [ minextmakerpctoch snd (x1,x2) | x1 <- [[0,9,3], [8,8,5]], x2 <- "dr" ]
subdeck06mminextlist = [ minextmakerpdtost snd (x1,x2) | x1 <- [[6,4,9], [8,7,6]], x2 <- ["carrot", "turtle"] ]
subdeck06nminextlist = [ minextmakerpetonu snd (x1,x2) | x1 <- ["horse", "esquilax"], x2 <- [1, 9] ]
subdeck06ominextlist = [ minextmakerpftoch snd (x1,x2) | x1 <- ["donkey", "fnord"], x2 <- "jt" ]
subdeck06pminextlist = [ minextmakerpgtonl snd (x1,x2) | x1 <- ["potato", "pizza"], x2 <- [[1,6,1], [8,7,2]] ]
subdeck06minextlist  = concat [subdeck06aminextlist, subdeck06bminextlist, subdeck06cminextlist, subdeck06dminextlist, subdeck06eminextlist, subdeck06fminextlist, subdeck06gminextlist, subdeck06hminextlist, subdeck06iminextlist, subdeck06jminextlist, subdeck06kminextlist, subdeck06lminextlist, subdeck06mminextlist, subdeck06nminextlist, subdeck06ominextlist, subdeck06pminextlist]

subdeck07aminextlist = [ concat [minextmakermhmhtomhi' (&&) x y, newline, minextmakermhmhtomhi' (&&) y x, newline, minextmakermhmhtomhi' (&&) True True, newline, minextmakermhmhtomhi (&&) False False] | x <- [True, False], y <- [True, False], x /= y ]
subdeck07bminextlist = [ concat [minextmakermhmhtomhi' (&&) x y, newline, minextmakermhmhtomhi' (&&) y x, newline, minextmakermhmhtomhi' (&&) False False, newline, minextmakermhmhtomhi (&&) True True] | x <- [True, False], y <- [True, False], x /= y ]
subdeck07cminextlist = [ concat [minextmakermhmhtomhi' (&&) True True, newline, minextmakermhmhtomhi' (&&) False False, newline, minextmakermhmhtomhi' (&&) x y, newline, minextmakermhmhtomhi (&&) y x] | x <- [True, False], y <- [True, False], x /= y ]
subdeck07dminextlist = [ concat [minextmakermhmhtomhi' (&&) False False, newline, minextmakermhmhtomhi' (&&) True True, newline, minextmakermhmhtomhi' (&&) x y, newline, minextmakermhmhtomhi (&&) y x] | x <- [True, False], y <- [True, False], x /= y ]
subdeck07minextlist  = concat [subdeck07aminextlist, subdeck07bminextlist, subdeck07cminextlist, subdeck07dminextlist]

subdeck08aminextlist = [ concat [minextmakermhmhtomhi' (||) x y, newline, minextmakermhmhtomhi' (||) y x, newline, minextmakermhmhtomhi' (||) True True, newline, minextmakermhmhtomhi (||) False False] | x <- [True, False], y <- [True, False], x /= y ]
subdeck08bminextlist = [ concat [minextmakermhmhtomhi' (||) x y, newline, minextmakermhmhtomhi' (||) y x, newline, minextmakermhmhtomhi' (||) False False, newline, minextmakermhmhtomhi (||) True True] | x <- [True, False], y <- [True, False], x /= y ]
subdeck08cminextlist = [ concat [minextmakermhmhtomhi' (||) True True, newline, minextmakermhmhtomhi' (||) False False, newline, minextmakermhmhtomhi' (||) x y, newline, minextmakermhmhtomhi (||) y x] | x <- [True, False], y <- [True, False], x /= y ]
subdeck08dminextlist = [ concat [minextmakermhmhtomhi' (||) False False, newline, minextmakermhmhtomhi' (||) True True, newline, minextmakermhmhtomhi' (||) x y, newline, minextmakermhmhtomhi (||) y x] | x <- [True, False], y <- [True, False], x /= y ]
subdeck08minextlist  = concat [subdeck08aminextlist, subdeck08bminextlist, subdeck08cminextlist, subdeck08dminextlist]

subdeck09minextlist  = [minextmakermhtomh not x | x <- [True, False] ]

subdeck10minextlist  = [concat [termopen1, newline, truevaluewithcolor, newline, prelprompt]]

subdeck11aminextlist = [ concat [minextmakernutonu' negate x, newline, minextmakernutonu negate (-x)] | x <- take 10 samplenumbers1 ++ (take 10 $ map (0-) samplenumbers1) ]
subdeck11bminextlist = [ concat [minextmakernutonu' negate x, newline, minextmakernutonu negate (-x)] | x <- take 10 samplenumbers2 ++ (take 10 $ map (0-) samplenumbers2) ]
subdeck11minextlist  = subdeck11aminextlist ++ subdeck11bminextlist

subdeck12aminextlist = [ concat [minextmakernutonu' abs x, newline, minextmakernutonu abs (-x)] | x <- take 10 $ drop 10 $ samplenumbers1 ++ (take 10 $ drop 10 $ map (0-) samplenumbers1) ]
subdeck12bminextlist = [ concat [minextmakernutonu' abs x, newline, minextmakernutonu abs (-x)] | x <- take 10 $ drop 10 $ samplenumbers2 ++ (take 10 $ drop 10 $ map (0-) samplenumbers2) ]
subdeck12minextlist  = subdeck12aminextlist ++ subdeck12bminextlist

subdeck13aminextlist = [ minextmakernutonur recip x | x <- [2.0, 3.0, 4.0, 5.0, 10.0, 100.0] :: [Float] ]
subdeck13bminextlist = [ minextmakernutonur recip (recip x) | x <- [2.0, 3.0, 4.0, 5.0, 10.0, 100.0] :: [Float] ]
subdeck13minextlist  = subdeck13aminextlist ++ subdeck13bminextlist

subdeck14minextlist  = [ let restrunc = (take 8 $ show $ exp x) ++ "..." in concat [termopen1, shownumwithcolor x, newline, htmlcolor4 restrunc, newline, showtermcommentwithcolor "Prelude> " (concat ["-- where ", restrunc, " is e (the base of the natural logarithm) to the power of ", htmlcolor3 $ show x, newline, prelprompt])] | x <- [2..13] ]

subdeck15minextlist  = [ let restrunc = (take 8 $ show $ log $ fromIntegral x) ++ "..." in concat [termopen1, shownumwithcolor x, newline, htmlcolor4 restrunc, newline, showtermcommentwithcolor "Prelude> " (concat ["-- where ", restrunc, " is the natural logarithm of ", htmlcolor3 $ show x, newline, prelprompt])] | x <- samplenumbers2 ]

subdeck16minextlist  = [ minextmakernunutonur logBase x y | (x,y) <- [(2.0,8.0),(2.0,16.0),(2.0,32.0),(2.0,64.0),(2.0,128.0),(2.0,256.0),(3.0,81.0),(4.0,64.0),(5.0,125.0),(6.0,216.0),(10.0,1000.0),(10.0,10000.0)] :: [(Float,Float)] ]

subdeck17aminextlist = [ minextmakernunutonu gcd x y | (x,y) <- [(6,15),(6,27),(6,33),(6,39),(8,12),(8,20),(8,28),(9,15),(9,21),(9,24),(9,39),(10,25),(10,35),(10,45),(12,20),(12,28),(12,32),(14,35),(14,49),(16,28),(21,35),(22,33),(22,55),(33,55),(44,55)] ]
subdeck17bminextlist = [ minextmakernunutonu gcd y x | (x,y) <- [(6,15),(6,27),(6,33),(6,39),(8,12),(8,20),(8,28),(9,15),(9,21),(9,24),(9,39),(10,25),(10,35),(10,45),(12,20),(12,28),(12,32),(14,35),(14,49),(16,28),(21,35),(22,33),(22,55),(33,55),(44,55)] ]
subdeck17minextlist  = subdeck17aminextlist ++ subdeck17bminextlist

subdeck18aminextlist = [ minextmakernunutonu lcm x y | (x,y) <- [(4,6),(4,10),(4,14),(4,18),(4,22),(6,8),(6,10),(6,14),(6,15),(6,16),(6,20),(8,10),(8,12),(8,20),(8,22),(8,30),(9,12),(9,15),(9,21),(9,24),(9,30),(9,33),(10,12),(10,14),(10,16),(10,18),(10,22),(10,24),(10,25)] ]
subdeck18bminextlist = [ minextmakernunutonu lcm y x | (x,y) <- [(4,6),(4,10),(4,14),(4,18),(4,22),(6,8),(6,10),(6,14),(6,15),(6,16),(6,20),(8,10),(8,12),(8,20),(8,22),(8,30),(9,12),(9,15),(9,21),(9,24),(9,30),(9,33),(10,12),(10,14),(10,16),(10,18),(10,22),(10,24),(10,25)] ]
subdeck18minextlist  = subdeck18aminextlist ++ subdeck18bminextlist

subdeck19aminextlist = [ minextmakerststtosti (++) x y | x <- take 5 $ drop 6 $ samplewords1, y <- take 5 $ drop 11 $ samplewords1 ]
subdeck19bminextlist = [ minextmakernlnltonli (++) x y | x <- take 5 $ drop 6 $ samplenumlists1, y <- take 5 $ drop 11 $ samplenumlists1 ]
subdeck19minextlist  = subdeck19aminextlist ++ subdeck19bminextlist

subdeck20aminextlist = [ minextmakerstnutochi (!!) x y | x <- take 6 $ drop 13 $ samplewords1, y <- [0,1,2,3] ]
subdeck20bminextlist = [ minextmakernlnutonui (!!) x y | x <- take 6 $ drop 13 $ samplenumlists1, y <- [0,1,2,3] ]
subdeck20minextlist  = subdeck20aminextlist ++ subdeck20bminextlist

subdeck21aminextlist = [ minextmakernltonu maximum x | x <- samplenumlists1 ]
subdeck21bminextlist = [ minextmakersttoch maximum x | x <- ["vzeikrp","nqjwdlm","szujmci","tynpgan","jkybwgt","jcftypm","ochwtpn","wlzcuvl","kqakjyl","oetxbij","glnbvpm","hgnwdoj","jhcmwsn","svgkbie","gkczmrn"] ]
subdeck21minextlist  = subdeck21aminextlist ++ subdeck21bminextlist

subdeck22aminextlist = [ minextmakernltonu minimum x | x <- samplenumlists1 ]
subdeck22bminextlist = [ minextmakersttoch minimum x | x <- ["vzeikrp","nqjwdlm","szujmci","tynpgan","jkybwgt","jcftypm","ochwtpn","wlzcuvl","kqakjyl","oetxbij","glnbvpm","hgnwdoj","jhcmwsn","svgkbie","gkczmrn"] ]
subdeck22minextlist  = subdeck22aminextlist ++ subdeck21bminextlist

subdeck23minextlist  = [ minextmakernltonu sum x | x <- samplenumlists1 ]

subdeck24minextlist  = [ minextmakernltonu product x | x <- filter (0 `notElem`) samplenumlists1 ]

subdeck25aminextlist = [ concat [minextmakermltomh' and [True, True, True], newline, minextmakermltomh' and [False, False, False], newline, minextmakermltomh and [x, y, z]] | x <- [True, False], y <- [True, False], z <- [True, False], (x, y, z) /= (False, False, False), (x, y, z) /= (True, True, True) ]
subdeck25bminextlist = [ concat [minextmakermltomh' and [False, False, False], newline, minextmakermltomh' and [True, True, True], newline, minextmakermltomh and [x, y, z]] | x <- [True, False], y <- [True, False], z <- [True, False], (x, y, z) /= (False, False, False), (x, y, z) /= (True, True, True) ]
subdeck25cminextlist = [ concat [minextmakermltomh' and [x, y, z], newline, minextmakermltomh' and [True, True, True], newline, minextmakermltomh and [False, False, False]] | x <- [True, False], y <- [True, False], z <- [True, False], (x, y, z) /= (False, False, False), (x, y, z) /= (True, True, True) ]
subdeck25dminextlist = [ concat [minextmakermltomh' and [x, y, z], newline, minextmakermltomh' and [False, False, False], newline, minextmakermltomh and [True, True, True]] | x <- [True, False], y <- [True, False], z <- [True, False], (x, y, z) /= (False, False, False), (x, y, z) /= (True, True, True) ]
subdeck25minextlist  = concat [subdeck25aminextlist, subdeck25bminextlist, subdeck25cminextlist, subdeck25dminextlist]

subdeck26aminextlist = [ concat [minextmakermltomh' or [True, True, True], newline, minextmakermltomh' or [False, False, False], newline, minextmakermltomh or [x, y, z]] | x <- [True, False], y <- [True, False], z <- [True, False], (x, y, z) /= (False, False, False), (x, y, z) /= (True, True, True) ]
subdeck26bminextlist = [ concat [minextmakermltomh' or [False, False, False], newline, minextmakermltomh' or [True, True, True], newline, minextmakermltomh or [x, y, z]] | x <- [True, False], y <- [True, False], z <- [True, False], (x, y, z) /= (False, False, False), (x, y, z) /= (True, True, True) ]
subdeck26cminextlist = [ concat [minextmakermltomh' or [x, y, z], newline, minextmakermltomh' or [True, True, True], newline, minextmakermltomh or [False, False, False]] | x <- [True, False], y <- [True, False], z <- [True, False], (x, y, z) /= (False, False, False), (x, y, z) /= (True, True, True) ]
subdeck26dminextlist = [ concat [minextmakermltomh' or [x, y, z], newline, minextmakermltomh' or [False, False, False], newline, minextmakermltomh or [True, True, True]] | x <- [True, False], y <- [True, False], z <- [True, False], (x, y, z) /= (False, False, False), (x, y, z) /= (True, True, True) ]
subdeck26minextlist  = concat [subdeck26aminextlist, subdeck26bminextlist, subdeck26cminextlist, subdeck26dminextlist]

-- These lines define the card ID Strings.
subdeck01cardids = map (\n -> "Q1B01" ++ showlastindex n) [1..(length subdeck01minextlist)]
subdeck02cardids = map (\n -> "Q1B02" ++ showlastindex n) [1..(length subdeck02minextlist)]
subdeck03cardids = map (\n -> "Q1B03" ++ showlastindex n) [1..(length subdeck03minextlist)]
subdeck04cardids = map (\n -> "Q1B04" ++ showlastindex n) [1..(length subdeck04minextlist)]
subdeck05cardids = map (\n -> "Q1B05" ++ showlastindex n) [1..(length subdeck05minextlist)]
subdeck06cardids = map (\n -> "Q1B06" ++ showlastindex n) [1..(length subdeck06minextlist)]
subdeck07cardids = map (\n -> "Q1B07" ++ showlastindex n) [1..(length subdeck07minextlist)]
subdeck08cardids = map (\n -> "Q1B08" ++ showlastindex n) [1..(length subdeck08minextlist)]
subdeck09cardids = map (\n -> "Q1B09" ++ showlastindex n) [1..(length subdeck09minextlist)]
subdeck10cardids = map (\n -> "Q1B10" ++ showlastindex n) [1..(length subdeck10minextlist)]
subdeck11cardids = map (\n -> "Q1B11" ++ showlastindex n) [1..(length subdeck11minextlist)]
subdeck12cardids = map (\n -> "Q1B12" ++ showlastindex n) [1..(length subdeck12minextlist)]
subdeck13cardids = map (\n -> "Q1B13" ++ showlastindex n) [1..(length subdeck13minextlist)]
subdeck14cardids = map (\n -> "Q1B14" ++ showlastindex n) [1..(length subdeck14minextlist)]
subdeck15cardids = map (\n -> "Q1B15" ++ showlastindex n) [1..(length subdeck15minextlist)]
subdeck16cardids = map (\n -> "Q1B16" ++ showlastindex n) [1..(length subdeck16minextlist)]
subdeck17cardids = map (\n -> "Q1B17" ++ showlastindex n) [1..(length subdeck17minextlist)]
subdeck18cardids = map (\n -> "Q1B18" ++ showlastindex n) [1..(length subdeck18minextlist)]
subdeck19cardids = map (\n -> "Q1B19" ++ showlastindex n) [1..(length subdeck19minextlist)]
subdeck20cardids = map (\n -> "Q1B20" ++ showlastindex n) [1..(length subdeck20minextlist)]
subdeck21cardids = map (\n -> "Q1B21" ++ showlastindex n) [1..(length subdeck21minextlist)]
subdeck22cardids = map (\n -> "Q1B22" ++ showlastindex n) [1..(length subdeck22minextlist)]
subdeck23cardids = map (\n -> "Q1B23" ++ showlastindex n) [1..(length subdeck23minextlist)]
subdeck24cardids = map (\n -> "Q1B24" ++ showlastindex n) [1..(length subdeck24minextlist)]
subdeck25cardids = map (\n -> "Q1B25" ++ showlastindex n) [1..(length subdeck25minextlist)]
subdeck26cardids = map (\n -> "Q1B26" ++ showlastindex n) [1..(length subdeck25minextlist)]

-- These lines are the values for the description of the function for each subdeck.
subdeck01descriptions = repeat "This function returns equal to whatever input it's given."
subdeck02descriptions = repeat "This function returns the next bigger integer to a number."
subdeck03descriptions = repeat "This function returns the next smaller integer to a number."
subdeck04descriptions = repeat "This function subtracts a number from a number (prefix, inp2 minus inp1)."
subdeck05descriptions = repeat "This function returns the first of a pair (two-tuple)."
subdeck06descriptions = repeat "This function returns the second of a pair (two-tuple)."
subdeck07descriptions = repeat "This function is the boolean AND for 2 inputs."
subdeck08descriptions = repeat "This function is the boolean OR for 2 inputs."
subdeck09descriptions = repeat "This function is the boolean NOT."
subdeck10descriptions = repeat "This is the other name for True."
subdeck11descriptions = repeat "This function returns the negative of a number."
subdeck12descriptions = repeat "This function returns the absolute value of a number."
subdeck13descriptions = repeat "This function returns the reciprocal of a number."
subdeck14descriptions = repeat "This function returns the value of e to the power of a number."
subdeck15descriptions = repeat "This function returns the logarithm base e (natural logarithm) of a number."
subdeck16descriptions = repeat "This function returns the logarithm of a given number to a given base."
subdeck17descriptions = repeat "This function returns the greatest common denominator of two numbers."
subdeck18descriptions = repeat "This function returns the lowest common multiple of a number."
subdeck19descriptions = repeat "This function joins two lists into one list."
subdeck20descriptions = repeat "This function returns the item at a given index in a given list."
subdeck21descriptions = repeat "This function returns the largest number in a list (or the most successive item in a list of any orderable type of thing)."
subdeck22descriptions = repeat "This function returns the smallest number in a list (or the least successive item in a list of any orderable type of thing)."
subdeck23descriptions = repeat "This function returns the sum of all the numbers in a list."
subdeck24descriptions = repeat "This function returns the product of all the numbers in a list."
subdeck25descriptions = repeat "This function indicates whether all of the items in a list of Bools are True."
subdeck26descriptions = repeat "This function indicates whether any of the items in a list of Bools is True."

-- These lines are the answers for the name of the function for each subdeck.
subdeck01answers = repeat "id"
subdeck02answers = repeat "ceiling"
subdeck03answers = repeat "floor"
subdeck04answers = repeat "subtract"
subdeck05answers = repeat "fst"
subdeck06answers = repeat "snd"
subdeck07answers = repeat "&&"
subdeck08answers = repeat "||"
subdeck09answers = repeat "not"
subdeck10answers = repeat "otherwise"
subdeck11answers = repeat "negate"
subdeck12answers = repeat "abs"
subdeck13answers = repeat "recip"
subdeck14answers = repeat "exp"
subdeck15answers = repeat "log"
subdeck16answers = repeat "logBase"
subdeck17answers = repeat "gcd"
subdeck18answers = repeat "lcm"
subdeck19answers = repeat "++"
subdeck20answers = repeat "!!"
subdeck21answers = repeat "maximum"
subdeck22answers = repeat "minimum"
subdeck23answers = repeat "sum"
subdeck24answers = repeat "product"
subdeck25answers = repeat "and"
subdeck26answers = repeat "or"

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
q1B01cardidsshownjs = "var Q1B01 = [" ++ intercalate "," subdeck01cardids ++ "];"
q1B02cardidsshownjs = "var Q1B02 = [" ++ intercalate "," subdeck02cardids ++ "];"
q1B03cardidsshownjs = "var Q1B03 = [" ++ intercalate "," subdeck03cardids ++ "];"
q1B04cardidsshownjs = "var Q1B04 = [" ++ intercalate "," subdeck04cardids ++ "];"
q1B05cardidsshownjs = "var Q1B05 = [" ++ intercalate "," subdeck05cardids ++ "];"
q1B06cardidsshownjs = "var Q1B06 = [" ++ intercalate "," subdeck06cardids ++ "];"
q1B07cardidsshownjs = "var Q1B07 = [" ++ intercalate "," subdeck07cardids ++ "];"
q1B08cardidsshownjs = "var Q1B08 = [" ++ intercalate "," subdeck08cardids ++ "];"
q1B09cardidsshownjs = "var Q1B09 = [" ++ intercalate "," subdeck09cardids ++ "];"
q1B10cardidsshownjs = "var Q1B10 = [" ++ intercalate "," subdeck10cardids ++ "];"
q1B11cardidsshownjs = "var Q1B11 = [" ++ intercalate "," subdeck11cardids ++ "];"
q1B12cardidsshownjs = "var Q1B12 = [" ++ intercalate "," subdeck12cardids ++ "];"
q1B13cardidsshownjs = "var Q1B13 = [" ++ intercalate "," subdeck13cardids ++ "];"
q1B14cardidsshownjs = "var Q1B14 = [" ++ intercalate "," subdeck14cardids ++ "];"
q1B15cardidsshownjs = "var Q1B15 = [" ++ intercalate "," subdeck15cardids ++ "];"
q1B16cardidsshownjs = "var Q1B16 = [" ++ intercalate "," subdeck16cardids ++ "];"
q1B17cardidsshownjs = "var Q1B17 = [" ++ intercalate "," subdeck17cardids ++ "];"
q1B18cardidsshownjs = "var Q1B18 = [" ++ intercalate "," subdeck18cardids ++ "];"
q1B19cardidsshownjs = "var Q1B19 = [" ++ intercalate "," subdeck19cardids ++ "];"
q1B20cardidsshownjs = "var Q1B20 = [" ++ intercalate "," subdeck20cardids ++ "];"
q1B21cardidsshownjs = "var Q1B21 = [" ++ intercalate "," subdeck21cardids ++ "];"
q1B22cardidsshownjs = "var Q1B22 = [" ++ intercalate "," subdeck22cardids ++ "];"
q1B23cardidsshownjs = "var Q1B23 = [" ++ intercalate "," subdeck23cardids ++ "];"
q1B24cardidsshownjs = "var Q1B24 = [" ++ intercalate "," subdeck24cardids ++ "];"
q1B25cardidsshownjs = "var Q1B25 = [" ++ intercalate "," subdeck25cardids ++ "];"
q1B26cardidsshownjs = "var Q1B26 = [" ++ intercalate "," subdeck26cardids ++ "];"

-- The footer of the deck has a line for each subdeck and each subdeck's line lists the names of the cards in it.
deck1bfooter1string = intercalate "\n" [q1B01cardidsshownjs, q1B02cardidsshownjs, q1B03cardidsshownjs, q1B04cardidsshownjs, q1B05cardidsshownjs, q1B06cardidsshownjs, q1B07cardidsshownjs, q1B08cardidsshownjs, q1B09cardidsshownjs, q1B10cardidsshownjs, q1B11cardidsshownjs, q1B12cardidsshownjs, q1B13cardidsshownjs, q1B14cardidsshownjs, q1B15cardidsshownjs, q1B16cardidsshownjs, q1B17cardidsshownjs, q1B18cardidsshownjs, q1B19cardidsshownjs, q1B20cardidsshownjs, q1B21cardidsshownjs, q1B22cardidsshownjs, q1B23cardidsshownjs, q1B24cardidsshownjs, q1B25cardidsshownjs, q1B26cardidsshownjs]

-- The end of the footer of the deck has the name of the deck and the names of all the subdecks as an array.
deck1bfooter2string = "var Q1Ball = [" ++ subdecklistshown ++ "];"
   where subdecklistshown = intercalate "," qtaglist 
         qtaglist = map qtag [1..26]
         qtag inpnum = if inpnum < 10 then "Q1B0" ++ show inpnum else "Q1B" ++ show inpnum

-- The output string is made of each subdeck rendered to string plus the footer strings
deckntf31bjsfilestring = concat [subdeck01string, subdeck02string, subdeck03string, subdeck04string, subdeck05string, subdeck06string, subdeck07string, subdeck08string, subdeck09string, subdeck10string, subdeck11string, subdeck12string, subdeck13string, subdeck14string, subdeck15string, subdeck16string, subdeck17string, subdeck18string, subdeck19string, subdeck20string, subdeck21string, subdeck22string, subdeck23string, subdeck24string, subdeck25string, subdeck26string, deck1bfooter1string, "\n", deck1bfooter2string]

-- main is the singular IO operation, which
-- takes the whole deck rendered to a string and writes it as a .js file
-- containing each card's name, terminal text, and answer,
-- each subdeck's list of cards, and the whole deck's list of subdecks.
main = writeFile "deck_ntf3_1b.js" deckntf31bjsfilestring
