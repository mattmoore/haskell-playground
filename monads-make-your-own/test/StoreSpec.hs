module StoreSpec where

import           Store
import           Test.Hspec

spec :: Spec
spec = do
  describe "add" $ do
    let inventory         = [ Inventory { Inventory.id = 1, Inventory.name = "Cat food" } ]
    let newItem           =   Inventory { Inventory.id = 2, Inventory.name = "Cat food" }
    let expectedInventory = newItem : inventory
    it "adds to the inventory" $ do
      result <- add newItem inventory
      result `shouldBe` expectedInventory
  describe "remove" $ do
    let inventory         = [ Inventory { Inventory.id = 1, Inventory.name = "Cat food" }
                            , Inventory { Inventory.id = 2, Inventory.name = "Cat food" } ]
    let expectedInventory = [ Inventory { Inventory.id = 1, Inventory.name = "Cat food" } ]
    let itemId = 2
    it "adds to the inventory" $ do
      result <- remove itemId inventory
      result `shouldBe` expectedInventory
