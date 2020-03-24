module Main where

import           MyMaybe

main :: IO ()
-- main = putStrLn "See specs"
main = do
  value <- return monadicJust
  case value of
    MyNothing -> putStrLn "Nothing"
    MyJust x  -> putStrLn $ show x
