{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Exception
import Formatting
import Formatting.Clock
import System.Clock
import System.Environment
import Lib

files :: Int -> [String]
files count = map (\x -> "files/data" ++ show x ++ ".txt") [1..count]

main :: IO ()
main = do
  args <- getArgs
  start <- getTime Monotonic
  results <- fetchFiles ((files . read . head) args)
  end <- getTime Monotonic
  putStrLn (merge results)
  fprint (timeSpecs % "\n") start end
