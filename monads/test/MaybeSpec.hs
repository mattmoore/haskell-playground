module MaybeSpec where

import Test.Hspec

spec :: Spec
spec = do

  describe "Maybe" $ do

    it "is an algebraic data type (ADT) made of Just and Nothing" $ do
      Just 1 `shouldBe` Just 1
