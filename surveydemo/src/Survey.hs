module Survey where

import System.IO
import Data.Char
import Data.List

giveSurvey :: IO ()
giveSurvey =
      question "What is your name?"
  >>= respond . greeting
  >>  question "How old are you?"
  >>= \age -> (respond . ageResponse) age
  >>  question ("Do you feel " ++ age ++ "?")
  >>= respond . feelingResponse
  >>  finish

greeting :: String -> String
greeting name = "Hello, " ++ properCase name ++ ". "

ageResponse :: String -> String
ageResponse age = "You are " ++ age ++ " years old."

feelingResponse :: String -> String
feelingResponse feels
  | isPrefixOf "y" feels = "You feel your age."
  | otherwise            = "You should seek help."

respond :: String -> IO ()
respond message = putStrLn message >> hFlush stdout

question :: String -> IO String
question message =
  hSetBuffering stdin LineBuffering
  >> putStr (message ++ ": ")
  >> hFlush stdout
  >> getLine

finish :: IO ()
finish = putStrLn "Thank you for taking the quiz."

properCase :: String -> String
properCase = unwords . map capitalize . words
  where capitalize (x:xs) = toUpper x : map toLower xs
