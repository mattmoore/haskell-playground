module MaybeSpec where

import Test.Hspec

spec :: Spec
spec = do

  describe "Maybe is an algebraic data type (ADT) made of Just and Nothing" $ do
    it "has a Just type that contains a value" $ do
      Just 1 `shouldBe` Just 1

    it "has a Nothing type that contains no value and replaces 'null' found in many languages" $ do
      (Nothing :: Maybe ()) `shouldBe` (Nothing :: Maybe ())

  describe "Maybe takes something and if it's a value, it returns (Just value), else Nothing" $ do
    it "should be Just 1" $ do
      (pure 1) `shouldBe` Just 1

  describe "Just is a functor" $ do
    it "can be mapped over" $ do
      fmap (+1) (Just 1) `shouldBe` Just 2

    it "fmap has an infix version <$>" $ do
      (+1) <$> (Just 1) `shouldBe` Just 2

    it "<$> can be applied to functors. we call these applicatives" $ do
      (+) <$> (Just 1) <*> (Just 1) `shouldBe` Just 2

    it "fmap can be applied to lists as well, since they're functors too" $ do
      fmap (*2) [1, 2, 3] `shouldBe` [2, 4, 6]

    it "same thing can be done with <$>" $ do
      (*2) <$> [1, 2, 3] `shouldBe` [2, 4, 6]
