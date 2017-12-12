module Main where

import Recursion

main :: IO ()
main = do
  putStrLn message
  where
    haystack = [1..90]
    results = map (\needle -> search needle haystack) [-5, 50, 100]
    message = unlines results
