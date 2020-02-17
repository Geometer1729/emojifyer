import Data.Char
import Data.List
import Data.Maybe

emojify :: String -> String
emojify w = unwords [ if head word `elem` "#@"
  then word -- don't change pings and channels
  else " " ++ emojifyWord word ++ " " -- pad with extra space to seperate emojified words
    | word <- words w ]

emojifyWord :: String -> String
emojifyWord w = let
  valid = listToMaybe [ (drop (length f) w,r) | (f,r) <- subs , f `isPrefixOf` w]
  in case valid of
    Nothing -> case w of -- if there are no applicable substitutions advance one charachter or return [] if done
      x : xs -> x : emojifyWord xs
      [] -> []
    Just (w',rep) -> rep ++ " " ++ emojifyWord w' -- space to prevent regional indicators becoming flags

subs :: [(String,String)]
subs = [
  ("!?",":interrobang:"),
  ("!",":exclamation:"),
  ("?",":question:"),
  ("1",":one:"),
  ("2",":two:"),
  ("3",":three:"),
  ("4",":four:"),
  ("5",":five:"),
  ("6",":six:"),
  ("7",":seven:"),
  ("8",":eight:"),
  ("9",":nine:"),
  ("0",":zero:"),
  ("o",":o2:"),
  ("O",":o2:")
  ] 
  ++ [ (w,":"++w++":") | w <- 
    ["abcd","new","free","atm","wc","ng","up","cool","sos","ab","vs","cl","b","a","x"]]
  ++ [ ([c],":regional_indicator_"++[toLower c,':']) | c <- ['a'..'z'] ++ ['A'..'Z'] ]

main :: IO ()
main = interact emojify
