module LibSpec where

import           Lib
import           Test.Hspec

spec :: Spec
spec = do
  describe "compose" $ do
    it "composes functions" $ do
      let doubler = (*2)
      ((compose doubler doubler) 2) `shouldBe` 8
      ((doubler `compose` doubler) 2) `shouldBe` 8
      ((doubler `compose` doubler `compose` doubler) 2) `shouldBe` 16
