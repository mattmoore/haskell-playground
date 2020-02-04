module Main where

import Lib
import Control.Monad.Trans.Maybe

main :: IO ()
main = do

  -- Here we get a value
  maybeJust <- runMaybeT maybeTJust
  case maybeJust of
    Nothing -> putStrLn "No value"
    Just x  -> putStrLn x

  -- Here we get nothing
  maybeNothing <- runMaybeT maybeTNothing
  case maybeNothing of
    Nothing -> putStrLn "No value"
    Just x  -> putStrLn x
