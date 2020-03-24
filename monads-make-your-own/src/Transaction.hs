{-# LANGUAGE DeriveGeneric #-}

module Transaction where

import           Data.Aeson
import           GHC.Generics

data Transaction = Transaction {
  amount :: Float
} deriving (Eq, Show, Generic)

instance FromJSON Transaction
instance ToJSON Transaction
