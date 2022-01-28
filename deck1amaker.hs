import Deckmakerhelpers
import Data.List(intercalate)

-- go = main because I like to be able to open the .hs file and then type "go" to make it do the thing.
go = main

subdeck01minextlist = [ concat [minextmakernunutonui (\x y -> roundn 1 (x + y)) x y] | x <- take 7 samplenumbers1, y <- take 7 samplenumbers1, x /= y ]

subdeck02minextlist = [ concat [minextmakernunutonui (\x y -> roundn 1 (x - y)) x y] | x <- take 7 samplenumbers1, y <- take 7 samplenumbers1, x /= y ]

subdeck03minextlist = [ concat [minextmakernunutonui (*) x y] | x <- [3..8], y <- [3..8] ]

subdeck04minextlist = [ concat [minextmakernunutonui (\x y -> roundn 4 (x / y)) x y] | x <- map fromIntegral $ take 11 samplenumbers2, y <- [2.0, 3.0, 4.0, 5.0] ]

subdeck05minextlist = [ concat [minextmakernunutonui (**) x y] | x <- [3.0, 4.0, 5.0, 6.0], y <- [2.0, 3.0] ]

subdeck06aminextlist = [ concat [ concat [minextmakernunutomhi' (==) x y, newline, minextmakernunutomhi' (==) y x, newline, minextmakernunutomhi (==) x x]] | x <- [1, 2, 4, 7, 9], y <- [1, 2, 4, 7, 9], x /= y ]
subdeck06bminextlist = [ concat [ concat [minextmakernunutomhi' (==) x x, newline, minextmakernunutomhi' (==) x y, newline, minextmakernunutomhi (==) y x]] | x <- [1, 2, 4, 7, 9], y <- [1, 2, 4, 7, 9], x /= y ]
subdeck06cminextlist = [ concat [ concat [minextmakerchchtomhi' (==) x y, newline, minextmakerchchtomhi' (==) y x, newline, minextmakerchchtomhi (==) x x]] | x <- "minge", y <- "minge", x /= y ]
subdeck06dminextlist = [ concat [ concat [minextmakerchchtomhi' (==) x x, newline, minextmakerchchtomhi' (==) x y, newline, minextmakerchchtomhi (==) y x]] | x <- "minge", y <- "minge", x /= y ]
subdeck06minextlist = concat [subdeck06aminextlist, subdeck06bminextlist, subdeck06cminextlist, subdeck06dminextlist]

subdeck07aminextlist = [ concat [ concat [minextmakernunutomhi' (/=) x y, newline, minextmakernunutomhi' (/=) y x, newline, minextmakernunutomhi (/=) x x]] | x <- [0, 1, 2, 4, 6], y <- [0, 1, 2, 4, 6], x /= y ]
subdeck07bminextlist = [ concat [ concat [minextmakernunutomhi' (/=) x x, newline, minextmakernunutomhi' (/=) x y, newline, minextmakernunutomhi (/=) y x]] | x <- [0, 1, 2, 4, 6], y <- [0, 1, 2, 4, 6], x /= y ]
subdeck07cminextlist = [ concat [ concat [minextmakerchchtomhi' (/=) x y, newline, minextmakerchchtomhi' (/=) y x, newline, minextmakerchchtomhi (/=) x x]] | x <- "groks", y <- "groks", x /= y ]
subdeck07dminextlist = [ concat [ concat [minextmakerchchtomhi' (/=) x x, newline, minextmakerchchtomhi' (/=) x y, newline, minextmakerchchtomhi (/=) y x]] | x <- "groks", y <- "groks", x /= y ]
subdeck07minextlist = concat [subdeck07aminextlist, subdeck07bminextlist, subdeck07cminextlist, subdeck07dminextlist]

subdeck08aminextlist = [ concat [ concat [minextmakernunutomhi' (<) x y, newline, minextmakernunutomhi' (<) y x, newline, minextmakernunutomhi (<) x x]] | x <- [0, 3, 4, 7, 9], y <- [1, 2, 4, 7, 9], x /= y ]
subdeck08bminextlist = [ concat [ concat [minextmakernunutomhi' (<) x x, newline, minextmakernunutomhi' (<) x y, newline, minextmakernunutomhi (<) y x]] | x <- [0, 3, 4, 7, 9], y <- [1, 2, 4, 7, 9], x /= y ]
subdeck08cminextlist = [ concat [ concat [minextmakerchchtomhi' (<) x y, newline, minextmakerchchtomhi' (<) y x, newline, minextmakerchchtomhi (<) x x]] | x <- "crumb", y <- "crumb", x /= y ]
subdeck08dminextlist = [ concat [ concat [minextmakerchchtomhi' (<) x x, newline, minextmakerchchtomhi' (<) x y, newline, minextmakerchchtomhi (<) y x]] | x <- "crumb", y <- "crumb", x /= y ]
subdeck08minextlist = concat [subdeck08aminextlist, subdeck08bminextlist, subdeck08cminextlist, subdeck08dminextlist]

subdeck09aminextlist = [ concat [ concat [minextmakernunutomhi' (<=) x y, newline, minextmakernunutomhi' (<=) y x, newline, minextmakernunutomhi (<=) x x]] | x <- [4, 5, 7, 8, 9], y <- [4, 5, 7, 8, 9], x /= y ]
subdeck09bminextlist = [ concat [ concat [minextmakernunutomhi' (<=) x x, newline, minextmakernunutomhi' (<=) x y, newline, minextmakernunutomhi (<=) y x]] | x <- [4, 5, 7, 8, 9], y <- [4, 5, 7, 8, 9], x /= y ]
subdeck09cminextlist = [ concat [ concat [minextmakerchchtomhi' (<=) x y, newline, minextmakerchchtomhi' (<=) y x, newline, minextmakerchchtomhi (<=) x x]] | x <- "blerp", y <- "blerp", x /= y ]
subdeck09dminextlist = [ concat [ concat [minextmakerchchtomhi' (<=) x x, newline, minextmakerchchtomhi' (<=) x y, newline, minextmakerchchtomhi (<=) y x]] | x <- "blerp", y <- "blerp", x /= y ]
subdeck09minextlist = concat [subdeck09aminextlist, subdeck09bminextlist, subdeck09cminextlist, subdeck09dminextlist]

subdeck10aminextlist = [ concat [ concat [minextmakernunutomhi' (>) x y, newline, minextmakernunutomhi' (>) y x, newline, minextmakernunutomhi (>) x x]] | x <- [1, 3, 4, 6, 9], y <- [1, 3, 4, 6, 9], x /= y ]
subdeck10bminextlist = [ concat [ concat [minextmakernunutomhi' (>) x x, newline, minextmakernunutomhi' (>) x y, newline, minextmakernunutomhi (>) y x]] | x <- [1, 3, 4, 6, 9], y <- [1, 3, 4, 6, 9], x /= y ]
subdeck10cminextlist = [ concat [ concat [minextmakerchchtomhi' (>) x y, newline, minextmakerchchtomhi' (>) y x, newline, minextmakerchchtomhi (>) x x]] | x <- "randy", y <- "randy", x /= y ]
subdeck10dminextlist = [ concat [ concat [minextmakerchchtomhi' (>) x x, newline, minextmakerchchtomhi' (>) x y, newline, minextmakerchchtomhi (>) y x]] | x <- "randy", y <- "randy", x /= y ]
subdeck10minextlist = concat [subdeck10aminextlist, subdeck10bminextlist, subdeck10cminextlist, subdeck10dminextlist]

subdeck11aminextlist = [ concat [ concat [minextmakernunutomhi' (>=) x y, newline, minextmakernunutomhi' (>=) y x, newline, minextmakernunutomhi (>=) x x]] | x <- [3, 4, 5, 7, 8], y <- [3, 4, 5, 7, 8], x /= y ]
subdeck11bminextlist = [ concat [ concat [minextmakernunutomhi' (>=) x x, newline, minextmakernunutomhi' (>=) x y, newline, minextmakernunutomhi (>=) y x]] | x <- [3, 4, 5, 7, 8], y <- [3, 4, 5, 7, 8], x /= y ]
subdeck11cminextlist = [ concat [ concat [minextmakerchchtomhi' (>=) x y, newline, minextmakerchchtomhi' (>=) y x, newline, minextmakerchchtomhi (>=) x x]] | x <- "morty", y <- "morty", x /= y ]
subdeck11dminextlist = [ concat [ concat [minextmakerchchtomhi' (>=) x x, newline, minextmakerchchtomhi' (>=) x y, newline, minextmakerchchtomhi (>=) y x]] | x <- "morty", y <- "morty", x /= y ]
subdeck11minextlist = concat [subdeck11aminextlist, subdeck11bminextlist, subdeck11cminextlist, subdeck11dminextlist]

subdeck12minextlist = [ concat [minextmakernutonu (sqrt . fromInteger) x] | x <- [144, 121, 100, 81, 64, 49, 36, 25, 16, 9] ]

subdeck13minextlist = [ let restrunc = (take 8 $ show $ sin x) ++ "..." in concat [termopen1, (htmlcolor4 $ showwut3 x), newline, htmlcolor4 restrunc, newline, showtermcommentwithcolor "Prelude> " (concat ["-- where ", restrunc, " is the sine of ", showwut3 x, newline, prelprompt])] | x <- drop 4 samplenumbers3 ]

subdeck14minextlist = [ let restrunc = (take 8 $ show $ cos x) ++ "..." in concat [termopen1, (htmlcolor4 $ showwut3 x), newline, htmlcolor4 restrunc, newline, showtermcommentwithcolor "Prelude> " (concat ["-- where ", restrunc, " is the cosine of ", showwut3 x, newline, prelprompt])] | x <- drop 2 samplenumbers3 ]

subdeck15minextlist = [ let restrunc = (take 8 $ show $ tan x) ++ "..." in concat [termopen1, (htmlcolor4 $ showwut3 x), newline, htmlcolor4 restrunc, newline, showtermcommentwithcolor "Prelude> " (concat ["-- where ", restrunc, " is the tangent of ", showwut3 x, newline, prelprompt])] | x <- drop 3 samplenumbers3 ]

subdeck16minextlist = [ let restrunc = (take 8 $ show $ asin x) ++ "..." in concat [termopen1, (htmlcolor4 $ showwut3 x), newline, htmlcolor4 restrunc, newline, showtermcommentwithcolor "Prelude> " (concat ["-- where ", restrunc, " is the arcsine of ", showwut3 x, newline, prelprompt])] | x <- drop 7 samplenumbers3 ]

subdeck17minextlist = [ let restrunc = (take 8 $ show $ acos x) ++ "..." in concat [termopen1, (htmlcolor4 $ showwut3 x), newline, htmlcolor4 restrunc, newline, showtermcommentwithcolor "Prelude> " (concat ["-- where ", restrunc, " is the arccosine of ", showwut3 x, newline, prelprompt])] | x <- samplenumbers3 ]

subdeck18minextlist = [ let restrunc = (take 8 $ show $ atan x) ++ "..." in concat [termopen1, (htmlcolor4 $ showwut3 x), newline, htmlcolor4 restrunc, newline, showtermcommentwithcolor "Prelude> " (concat ["-- where ", restrunc, " is the arctangent of ", showwut3 x, newline, prelprompt])] | x <- drop 2 samplenumbers3 ]

subdeck19minextlist = [concat [termopen1, newline, htmlcolor4 (take 7 (show pi) ++ "..."), newline, prelprompt]]

subdeck20aminextlist = [ concat [ concat [minextmakernutomh' even x, newline, minextmakernutomh even y]] | x <- take 5 $ filter even $ [1..], y <- take 5 $ filter odd $ [1..] ]
subdeck20bminextlist = [ concat [ concat [minextmakernutomh' even y, newline, minextmakernutomh even x]] | x <- take 5 $ filter even $ [1..], y <- take 5 $ filter odd $ [1..] ]
subdeck20minextlist = subdeck20aminextlist ++ subdeck20bminextlist

subdeck21aminextlist = [ concat [ concat [minextmakernutomh' odd x, newline, minextmakernutomh odd y]] | x <- take 5 $ filter even $ [1..], y <- take 5 $ filter odd $ [1..] ]
subdeck21bminextlist = [ concat [ concat [minextmakernutomh' odd y, newline, minextmakernutomh odd x]] | x <- take 5 $ filter even $ [1..], y <- take 5 $ filter odd $ [1..] ]
subdeck21minextlist = subdeck21aminextlist ++ subdeck21bminextlist

subdeck22aminextlist = [ concat [ concat [minextmakernutonu' round $ x + y, newline, minextmakernutonu round $ x + z]] | x <- [4, 5, 9], y <- [0.1, 0.2, 0.4], z <- [0.6, 0.7, 0.8] ]
subdeck22bminextlist = [ concat [ concat [minextmakernutonu' round $ x + z, newline, minextmakernutonu round $ x + y]] | x <- [2, 3], y <- [0.2, 0.3, 0.4], z <- [0.6, 0.8, 0.9] ]
subdeck22minextlist = subdeck22aminextlist ++ subdeck22bminextlist

subdeck23aminextlist = [ concat [ concat [minextmakernunutonu' max x y, newline, minextmakernunutonu max y x]] | x <- [1, 2, 6, 8, 9], y <- [0, 3, 5, 7] ]
subdeck23bminextlist = [ concat [ concat [minextmakernunutonu' max x y, newline, minextmakernunutonu max y x]] | x <- "fnord", y <- "xyzqw" ]
subdeck23minextlist = subdeck23aminextlist ++ subdeck23bminextlist

subdeck24aminextlist = [ concat [ concat [minextmakernunutonu' min x y, newline, minextmakernunutonu min y x]] | x <- [0, 1, 4, 5, 8], y <- [2, 3, 6, 9] ]
subdeck24bminextlist = [ concat [ concat [minextmakernunutonu' min x y, newline, minextmakernunutonu min y x]] | x <- "fnord", y <- "xyzqw" ]
subdeck24minextlist = subdeck24aminextlist ++ subdeck24bminextlist

subdeck25aminextlist = [ concat [ minextmakernutonu succ x] | x <- samplenumbers2 ]
subdeck25bminextlist = [ concat [ minextmakerchtoch succ x] | x <- ['a'..'y'] ]
subdeck25minextlist = subdeck25aminextlist ++ subdeck25bminextlist

subdeck26aminextlist = [ concat [ minextmakernutonu pred x] | x <- samplenumbers2 ]
subdeck26bminextlist = [ concat [ minextmakerchtoch pred x] | x <- ['b'..'z'] ]
subdeck26minextlist = subdeck26aminextlist ++ subdeck26bminextlist

-- These lines define the card ID Strings.
subdeck01cardids = map (\n -> "Q1A01" ++ showlastindex n) [1..(length subdeck01minextlist)]
subdeck02cardids = map (\n -> "Q1A02" ++ showlastindex n) [1..(length subdeck02minextlist)]
subdeck03cardids = map (\n -> "Q1A03" ++ showlastindex n) [1..(length subdeck03minextlist)]
subdeck04cardids = map (\n -> "Q1A04" ++ showlastindex n) [1..(length subdeck04minextlist)]
subdeck05cardids = map (\n -> "Q1A05" ++ showlastindex n) [1..(length subdeck05minextlist)]
subdeck06cardids = map (\n -> "Q1A06" ++ showlastindex n) [1..(length subdeck06minextlist)]
subdeck07cardids = map (\n -> "Q1A07" ++ showlastindex n) [1..(length subdeck07minextlist)]
subdeck08cardids = map (\n -> "Q1A08" ++ showlastindex n) [1..(length subdeck08minextlist)]
subdeck09cardids = map (\n -> "Q1A09" ++ showlastindex n) [1..(length subdeck09minextlist)]
subdeck10cardids = map (\n -> "Q1A10" ++ showlastindex n) [1..(length subdeck10minextlist)]
subdeck11cardids = map (\n -> "Q1A11" ++ showlastindex n) [1..(length subdeck11minextlist)]
subdeck12cardids = map (\n -> "Q1A12" ++ showlastindex n) [1..(length subdeck12minextlist)]
subdeck13cardids = map (\n -> "Q1A13" ++ showlastindex n) [1..(length subdeck13minextlist)]
subdeck14cardids = map (\n -> "Q1A14" ++ showlastindex n) [1..(length subdeck14minextlist)]
subdeck15cardids = map (\n -> "Q1A15" ++ showlastindex n) [1..(length subdeck15minextlist)]
subdeck16cardids = map (\n -> "Q1A16" ++ showlastindex n) [1..(length subdeck16minextlist)]
subdeck17cardids = map (\n -> "Q1A17" ++ showlastindex n) [1..(length subdeck17minextlist)]
subdeck18cardids = map (\n -> "Q1A18" ++ showlastindex n) [1..(length subdeck18minextlist)]
subdeck19cardids = map (\n -> "Q1A19" ++ showlastindex n) [1..(length subdeck19minextlist)]
subdeck20cardids = map (\n -> "Q1A20" ++ showlastindex n) [1..(length subdeck20minextlist)]
subdeck21cardids = map (\n -> "Q1A21" ++ showlastindex n) [1..(length subdeck21minextlist)]
subdeck22cardids = map (\n -> "Q1A22" ++ showlastindex n) [1..(length subdeck22minextlist)]
subdeck23cardids = map (\n -> "Q1A23" ++ showlastindex n) [1..(length subdeck23minextlist)]
subdeck24cardids = map (\n -> "Q1A24" ++ showlastindex n) [1..(length subdeck24minextlist)]
subdeck25cardids = map (\n -> "Q1A25" ++ showlastindex n) [1..(length subdeck25minextlist)]
subdeck26cardids = map (\n -> "Q1A26" ++ showlastindex n) [1..(length subdeck25minextlist)]

-- These lines are the values for the description of the function for each subdeck.
subdeck01descriptions = repeat "This function adds two numbers together."
subdeck02descriptions = repeat "This function subtracts a number from a number (infix, inp1 minus inp2)."
subdeck03descriptions = repeat "This function multiplies two numbers together."
subdeck04descriptions = repeat "This function divides a number from a number."
subdeck05descriptions = repeat "This function exponentiates a number by a number (the version that works with Floats)."
subdeck06descriptions = repeat "This function indicates whether two values are equal."
subdeck07descriptions = repeat "This function indicates whether two values are not equal."
subdeck08descriptions = repeat "This function indicates whether a number is less than a number (or, in general, whether an orderable thing is less successive)."
subdeck09descriptions = repeat "This function indicates whether a number is less than or equal to a number (or, in general, whether an orderable thing is less successive or equal)."
subdeck10descriptions = repeat "This function indicates whether a number is greater than a number (or, in general, whether an orderable thing is more successive)."
subdeck11descriptions = repeat "This function indicates whether a number is greater than or equal to a number (or, in general, whether an orderable thing is more successive or equal)."
subdeck12descriptions = repeat "This function returns the square root of a number."
subdeck13descriptions = repeat "This function returns the sine of a number."
subdeck14descriptions = repeat "This function returns the cosine of a number."
subdeck15descriptions = repeat "This function returns the tangent of a number."
subdeck16descriptions = repeat "This function returns the arcsine of a number."
subdeck17descriptions = repeat "This function returns the arccosine of a number."
subdeck18descriptions = repeat "This function returns the arctangent of a number."
subdeck19descriptions = repeat "This is the irrational number equal to the quotient of the circumference of a circle to its diameter."
subdeck20descriptions = repeat "This function indicates whether a number is divisible by 2."
subdeck21descriptions = repeat "This function indicates whether a number is not divisible by 2."
subdeck22descriptions = repeat "This function returns the nearest whole number to a number."
subdeck23descriptions = repeat "This function returns the bigger of two numbers (or, in general, the more successive of two orderable things)."
subdeck24descriptions = repeat "This function returns the smaller of two numbers (or, in general, the less successive of two orderable things)."
subdeck25descriptions = repeat "This function returns the successor of a thing."
subdeck26descriptions = repeat "This function returns the preceding thing (opposite of successor) to a thing."

-- These lines are the answers for the name of the function for each subdeck.
subdeck01answers = repeat "+"
subdeck02answers = repeat "-"
subdeck03answers = repeat "*"
subdeck04answers = repeat "/"
subdeck05answers = repeat "**"
subdeck06answers = repeat "=="
subdeck07answers = repeat "/="
subdeck08answers = repeat "<"
subdeck09answers = repeat "<="
subdeck10answers = repeat ">"
subdeck11answers = repeat ">="
subdeck12answers = repeat "sqrt"
subdeck13answers = repeat "sin"
subdeck14answers = repeat "cos"
subdeck15answers = repeat "tan"
subdeck16answers = repeat "asin"
subdeck17answers = repeat "acos"
subdeck18answers = repeat "atan"
subdeck19answers = repeat "pi"
subdeck20answers = repeat "even"
subdeck21answers = repeat "odd"
subdeck22answers = repeat "round"
subdeck23answers = repeat "max"
subdeck24answers = repeat "min"
subdeck25answers = repeat "succ"
subdeck26answers = repeat "pred"

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
q1A01cardidsshownjs = "var Q1A01 = [" ++ intercalate "," subdeck01cardids ++ "];"
q1A02cardidsshownjs = "var Q1A02 = [" ++ intercalate "," subdeck02cardids ++ "];"
q1A03cardidsshownjs = "var Q1A03 = [" ++ intercalate "," subdeck03cardids ++ "];"
q1A04cardidsshownjs = "var Q1A04 = [" ++ intercalate "," subdeck04cardids ++ "];"
q1A05cardidsshownjs = "var Q1A05 = [" ++ intercalate "," subdeck05cardids ++ "];"
q1A06cardidsshownjs = "var Q1A06 = [" ++ intercalate "," subdeck06cardids ++ "];"
q1A07cardidsshownjs = "var Q1A07 = [" ++ intercalate "," subdeck07cardids ++ "];"
q1A08cardidsshownjs = "var Q1A08 = [" ++ intercalate "," subdeck08cardids ++ "];"
q1A09cardidsshownjs = "var Q1A09 = [" ++ intercalate "," subdeck09cardids ++ "];"
q1A10cardidsshownjs = "var Q1A10 = [" ++ intercalate "," subdeck10cardids ++ "];"
q1A11cardidsshownjs = "var Q1A11 = [" ++ intercalate "," subdeck11cardids ++ "];"
q1A12cardidsshownjs = "var Q1A12 = [" ++ intercalate "," subdeck12cardids ++ "];"
q1A13cardidsshownjs = "var Q1A13 = [" ++ intercalate "," subdeck13cardids ++ "];"
q1A14cardidsshownjs = "var Q1A14 = [" ++ intercalate "," subdeck14cardids ++ "];"
q1A15cardidsshownjs = "var Q1A15 = [" ++ intercalate "," subdeck15cardids ++ "];"
q1A16cardidsshownjs = "var Q1A16 = [" ++ intercalate "," subdeck16cardids ++ "];"
q1A17cardidsshownjs = "var Q1A17 = [" ++ intercalate "," subdeck17cardids ++ "];"
q1A18cardidsshownjs = "var Q1A18 = [" ++ intercalate "," subdeck18cardids ++ "];"
q1A19cardidsshownjs = "var Q1A19 = [" ++ intercalate "," subdeck19cardids ++ "];"
q1A20cardidsshownjs = "var Q1A20 = [" ++ intercalate "," subdeck20cardids ++ "];"
q1A21cardidsshownjs = "var Q1A21 = [" ++ intercalate "," subdeck21cardids ++ "];"
q1A22cardidsshownjs = "var Q1A22 = [" ++ intercalate "," subdeck22cardids ++ "];"
q1A23cardidsshownjs = "var Q1A23 = [" ++ intercalate "," subdeck23cardids ++ "];"
q1A24cardidsshownjs = "var Q1A24 = [" ++ intercalate "," subdeck24cardids ++ "];"
q1A25cardidsshownjs = "var Q1A25 = [" ++ intercalate "," subdeck25cardids ++ "];"
q1A26cardidsshownjs = "var Q1A26 = [" ++ intercalate "," subdeck26cardids ++ "];"

-- The footer of the deck has a line for each subdeck and each subdeck's line lists the names of the cards in it.
deck1afooter1string = intercalate "\n" [q1A01cardidsshownjs, q1A02cardidsshownjs, q1A03cardidsshownjs, q1A04cardidsshownjs, q1A05cardidsshownjs, q1A06cardidsshownjs, q1A07cardidsshownjs, q1A08cardidsshownjs, q1A09cardidsshownjs, q1A10cardidsshownjs, q1A11cardidsshownjs, q1A12cardidsshownjs, q1A13cardidsshownjs, q1A14cardidsshownjs, q1A15cardidsshownjs, q1A16cardidsshownjs, q1A17cardidsshownjs, q1A18cardidsshownjs, q1A19cardidsshownjs, q1A20cardidsshownjs, q1A21cardidsshownjs, q1A22cardidsshownjs, q1A23cardidsshownjs, q1A24cardidsshownjs, q1A25cardidsshownjs, q1A26cardidsshownjs]

-- The end of the footer of the deck has the name of the deck and the names of all the subdecks as an array.
deck1afooter2string = "var Q1Aall = [" ++ subdecklistshown ++ "];"
   where subdecklistshown = intercalate "," qtaglist 
         qtaglist = map qtag [1..26]
         qtag inpnum = if inpnum < 10 then "Q1A0" ++ show inpnum else "Q1A" ++ show inpnum

-- The output string is made of each subdeck rendered to string plus the footer strings
deckntf31ajsfilestring = concat [subdeck01string, subdeck02string, subdeck03string, subdeck04string, subdeck05string, subdeck06string, subdeck07string, subdeck08string, subdeck09string, subdeck10string, subdeck11string, subdeck12string, subdeck13string, subdeck14string, subdeck15string, subdeck16string, subdeck17string, subdeck18string, subdeck19string, subdeck20string, subdeck21string, subdeck22string, subdeck23string, subdeck24string, subdeck25string, subdeck26string, deck1afooter1string, "\n", deck1afooter2string]

-- main is the singular IO operation, which
-- takes the whole deck rendered to a string and writes it as a .js file
-- containing each card's name, terminal text, and answer,
-- each subdeck's list of cards, and the whole deck's list of subdecks.
main = writeFile "deck_ntf3_1a.js" deckntf31ajsfilestring
