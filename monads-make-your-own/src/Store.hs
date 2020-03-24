{-# LANGUAGE DeriveGeneric #-}

module Store where

import           Data.Aeson
import           GHC.Generics
import           Inventory
import           Order
import           User

data Store = Store {
  path      :: String,
  users     :: [User],
  inventory :: [Inventory],
  orders    :: [Order]
} deriving (Eq, Show, Generic)

instance FromJSON Store
instance ToJSON Store

load :: String -> IO Store
load path = do
  store <- decodeFileStrict path :: IO (Maybe Store)
  case store of
    Just store -> return store
    Nothing    -> return Store {}

save :: String -> IO ()
save path = do
  encodeFileStrict path :: IO (Maybe Store)

-- placeOrder :: Store -> User -> Inventory -> IO Order
-- placeOrder store user item = do
--   transaction <- User.charge store user item
--   inventory <- Inventory.remove store item
--   order <- Order.create store user item
--   return order
--
-- userBalance :: Store -> User -> IO Float
-- userBalance store user = do
--   store <- Store.load . path $ store
--   return . sum . map amount . transactions $ user
--
-- charge :: Store -> User -> Inventory -> IO Transaction
-- charge store user item = do
--   let transaction = Transaction { amount = amount item }
--   let updatedUser = user { transactions = transaction : (transactions user) }
--   Store.save $ path store
--   return transaction
