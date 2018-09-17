{-# LANGUAGE DeriveGeneric #-}

module Lib
where

import           Data.Aeson
import           Data.ByteString.Lazy.Internal
import           GHC.Generics

data Person = Person {
  firstName :: String,
  lastName  :: String
} deriving (Eq, Show, Generic)

instance ToJSON Person
instance FromJSON Person

toJson :: Person -> ByteString
toJson person = encode person

fromJson :: ByteString -> Person
fromJson json =
  case (decode json :: Maybe Person) of
    Just person -> person
    Nothing     -> Person {}
