{-# LANGUAGE OverloadedStrings #-}

module Utility
( getFileName
, fetchBookData )
where

import Author
import Book
import Data.Aeson
import Data.Csv.Parser
import Data.List
import Data.Text as T (Text, pack, splitOn)
import Data.Text.IO (readFile)

getFileName :: [String] -> String
getFileName =
  head . tail

fetchBookData :: String -> IO [Book]
fetchBookData path = do
  books <- decodeFileStrict path :: IO (Maybe [Book])
  case books of
    Just books -> return books
    Nothing    -> return []
