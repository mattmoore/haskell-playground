module Transaction where

import           Data.Decimal

data Transaction = Transaction {
  amount :: Decimal
} deriving (Eq, Show)
