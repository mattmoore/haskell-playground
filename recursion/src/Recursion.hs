{-# LANGUAGE OverloadedStrings #-}

module Recursion
  (search)
where

import Formatting

search :: Int -> [Int] -> String
search needle haystack =
  formatToString (shown % " exists?: " % shown) needle result
  where
    result = exists needle haystack

exists :: Int -> [Int] -> Bool
exists needle haystack
  | haystack == []          = False
  | needle == head haystack = True
  | otherwise               = exists needle (tail haystack)
