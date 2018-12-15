module OrderSpec where

import           Inventory
import           Order
import           Test.Hspec
import           User

spec :: Spec
spec = do
  describe "create" $ do
    let user = User {
      firstName = "Matt",
      lastName = "Moore",
    }
    let order = Order { user = 1, order.inventory_id = 1 }
    let expectedOrders = order : orders
    it "creates a new order" $ do
      result <- Order.create order
      result `shouldBe` expectedorders
