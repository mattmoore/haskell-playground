{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module Book
( Book (..)
, formatBook
, formatBooks )
where

import           Author
import           Data.Aeson
import           Data.List
import           Data.Text    as T (Text, intercalate, lines, pack, splitOn)
import           GHC.Generics

data Book = Book {
  title  :: Text,
  author :: Author
} deriving (Eq, Generic, Show)

instance FromJSON Book
instance ToJSON Book

formatBook :: Book -> Text
formatBook book =
  T.intercalate " by " [title book, formatAuthor (author book)]

formatBooks :: [Book] -> Text
formatBooks =
  T.intercalate "\n" . map formatBook
