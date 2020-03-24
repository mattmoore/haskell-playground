{-# LANGUAGE DeriveGeneric #-}

module Inventory where

import           Data.Aeson
import           GHC.Generics

data Inventory = Inventory {
  name   :: String,
  amount :: Float
} deriving (Eq, Show, Generic)

instance FromJSON Inventory
instance ToJSON Inventory
