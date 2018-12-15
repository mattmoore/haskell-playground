{-# LANGUAGE DeriveGeneric #-}

module Order where

import           Data.Aeson
import           GHC.Generics
import           Inventory
import           Store
import           User

data Order = Order {
  id        :: Integer,
  inventory :: Inventory
} deriving (Eq, Show, Generic)

instance FromJSON Order
instance ToJSON Order

create :: Store -> User -> Inventory -> IO Order
create store user item = do
  let order = Order { inventory = item }
  let updatedUser = user { orders = order : orders user }
  Store.save store
  return order
