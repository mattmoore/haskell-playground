module UserSpec where

import           Test.Hspec
import           Transaction
import           User

spec :: Spec
spec = do
  describe "charge" $ do
    let user = User {
      User.id           = 1,
      User.firstName    = "Matt",
      User.lastName     = "Moore",
      User.transactions = []
    }
    let expectedUser = User {
      User.id           = 1,
      User.firstName    = "Matt",
      User.lastName     = "Moore",
      User.transactions = [ Transaction { amount = 25.50 } ]
    }
    it "applies a transaction to the user" $ do
      chargedUser <- charge user 25.50
      chargedUser `shouldBe` expectedUser

  describe "balance" $ do
    let user = User {
      User.id           = 1,
      User.firstName    = "Matt",
      User.lastName     = "Moore",
      User.transactions = [ Transaction { amount = 25.50 }
                          , Transaction { amount = 18.58 } ]
    }
    it "calculates the user's balance" $ do
      userBalance <- balance user
      userBalance `shouldBe` 44.08
