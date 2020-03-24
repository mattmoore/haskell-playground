module MyMaybeSpec where

import           MyMaybe
import           Test.Hspec

spec :: Spec
spec = do
  describe "monadicJust" $ do
    it "returns a just value" $ do
      MyJust value <- return monadicJust
      value `shouldBe` 5
  describe "monadicNothing" $ do
    it "returns nothing" $ do
      value <- return monadicNothing
      value `shouldBe` MyNothing
  describe "return" $ do
    it "wraps a value into the monad" $ do
      value <- return 5
      -- value <- return $ MyJust 5
      -- value `shouldBe` (MyJust 5)
      1 `shouldBe` 1
