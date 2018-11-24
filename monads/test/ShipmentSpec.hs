module ShipmentSpec where

import           Inventory
import           Shipment
import           Test.Hspec
import           User

spec :: Spec
spec = do
  describe "add" $ do
    let shipments = []
    let newShipment = Shipment { Shipment.id = 1, Shipment.user_id = 1, Shipment.inventory_id = 1 }
    let expectedShipments = newShipment : shipments
    it "adds to the inventory" $ do
      result <- Shipment.add newShipment shipments
      result `shouldBe` expectedShipments
  describe "remove" $ do
    let shipments         = [ Inventory { Inventory.id = 1, Inventory.name = "Cat food" }
                            , Inventory { Inventory.id = 2, Inventory.name = "Cat food" } ]
    let expectedShipments = [ Inventory { Inventory.id = 1, Inventory.name = "Cat food" } ]
    let itemId = 2
    it "adds to the inventory" $ do
      result <- remove itemId shipments
      result `shouldBe` expectedShipments
