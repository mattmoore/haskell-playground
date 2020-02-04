module Lib where

import Control.Monad.Trans.Maybe
import Control.Monad.Trans.Except

maybeTJust :: MaybeT IO String
maybeTJust = do
  return "My value"

maybeTNothing :: MaybeT IO String
maybeTNothing = do
  MaybeT (return Nothing)

exceptTRight :: ExceptT String IO String
exceptTRight = do
  return "I'm a right value"

exceptTLeft :: ExceptT String IO String
exceptTLeft = do
  ExceptT (return (Left "No value found"))
