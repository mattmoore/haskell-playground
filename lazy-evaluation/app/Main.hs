module Main where

main :: IO ()
main = do
  putStrLn (show (take 3 (repeat "A")))
