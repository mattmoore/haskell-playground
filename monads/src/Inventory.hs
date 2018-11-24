module Inventory where

import           Data.List

data Inventory = Inventory {
  id   :: Integer,
  name :: String
} deriving (Eq, Show)

add :: Inventory -> [Inventory] -> IO [Inventory]
add item inventory = do
  return $ item : inventory

remove :: Integer -> [Inventory] -> IO [Inventory]
remove itemId inventory = do
  return $ filter (\x -> Inventory.id x /= itemId) inventory
