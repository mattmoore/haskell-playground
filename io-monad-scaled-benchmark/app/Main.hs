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
-- main = do
--   args <- getArgs
--   let fileList = (files . read . head) args
--   start <- getTime Monotonic
--   results <- fetchFiles fileList
--   end <- getTime Monotonic
--   putStrLn (merge results)
--   fprint (timeSpecs % "\n") start end

main =
  fmap (files . read . head) getArgs >>= \fileList ->
  getTime Monotonic >>= \start ->
  fetchFiles fileList >>= \contents ->
  getTime Monotonic >>= \end ->
  (putStrLn . merge) contents
  >> fprint (timeSpecs % "\n") start end
