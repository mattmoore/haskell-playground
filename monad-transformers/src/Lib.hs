module Lib where

import Control.Monad.Trans.Maybe

maybeTJust :: MaybeT IO String
maybeTJust = do
  return "My value"

maybeTNothing :: MaybeT IO String
maybeTNothing = do
  MaybeT (return Nothing)
