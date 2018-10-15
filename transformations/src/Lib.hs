module Lib where

import Data.String

applyTransformations value transformations =
  foldl (\value f -> f value) "Matt" transformations
