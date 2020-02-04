module Lib where

import Control.Monad.Trans.Maybe

maybeTExample :: MaybeT IO String
maybeTExample = do
  return "My value"
