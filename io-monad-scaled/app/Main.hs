module Main where

import Lib

files :: [String]
files = map (\x -> "files/data" ++ show x ++ ".txt") [1..10000]

main :: IO ()
main = putStrLn . merge =<< fetchFiles files
