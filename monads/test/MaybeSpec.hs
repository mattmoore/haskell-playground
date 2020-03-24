module MaybeSpec where

import Test.Hspec

spec :: Spec
spec = do

  describe "Maybe is an algebraic data type (ADT) made of Just and Nothing" $ do

    it "has a Just type that contains a value" $ do
      Just 1 `shouldBe` Just 1

    it "has a Nothing type that contains no value and replaces 'null' found in many languages" $ do
      (Nothing :: Maybe ()) `shouldBe` (Nothing :: Maybe ())
