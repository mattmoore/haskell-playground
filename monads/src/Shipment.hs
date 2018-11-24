module Shipment where

data Shipment = Shipment {
  id           :: Integer,
  user_id      :: Integer,
  inventory_id :: Integer
} deriving (Eq, Show)


add :: Shipment -> [Shipment] -> IO [Shipment]
add shipment shipments = do
  return $ shipment : shipments
