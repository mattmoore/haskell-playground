module Main where

import Lib
import Control.Monad.Trans.Maybe
import Control.Monad.Trans.Except

main :: IO ()
main = do

  -- MaybeT

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

  -- ExceptT

  -- Value was returned
  exceptRight <- runExceptT exceptTRight
  case exceptRight of
    Left  e -> putStrLn e
    Right x -> putStrLn x

  -- Value errored
  exceptLeft <- runExceptT exceptTLeft
  case exceptLeft of
    Left  e -> putStrLn e
    Right x -> putStrLn x
