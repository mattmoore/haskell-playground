module Main where

import Lib
import Control.Monad.Trans.Maybe

main :: IO ()
main = do
  maybeValue <- runMaybeT maybeTExample
  case maybeValue of
    Just x  -> putStrLn x
    Nothing -> putStrLn "No value"
