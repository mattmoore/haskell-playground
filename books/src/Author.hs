{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Author
( Author (..)
, formatAuthor
, formatAuthors )
where

import Data.Aeson
import Data.List
import Data.Text as T (Text, intercalate, pack, splitOn)
import Data.Text.Read (decimal)
import GHC.Generics

data Author = Author {
  firstName :: Text,
  lastName  :: Text,
  birthYear :: Int
} deriving (Eq, Generic, Show)

instance FromJSON Author
instance ToJSON Author

formatAuthor :: Author -> Text
formatAuthor author =
  T.intercalate ", " [lastName author, firstName author]

formatAuthors :: [Author] -> Text
formatAuthors =
  T.intercalate "\n" . map formatAuthor
