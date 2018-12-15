{-# LANGUAGE DeriveGeneric #-}

module User where

import           Data.Aeson
import           GHC.Generics
import           Order

data User = User {
  id           :: Integer,
  firstName    :: String,
  lastName     :: String,
  orders       :: [Order],
  transactions :: [Transaction]
} deriving (Eq, Show, Generic)

instance FromJSON User
instance ToJSON User

charge :: Store -> User -> Inventory -> IO Transaction
charge store user item = do
  let transaction = Transaction { amount = amount item }
  let updatedUser = user { transactions = transaction : (transactions user) }
  Store.save $ path store
  return transaction

placeOrder :: Store -> User -> Inventory -> IO Order
placeOrder store user item = do
  transaction <- User.charge store user item
  inventory <- Inventory.remove store item
  order <- Order.create store user item
  return order
