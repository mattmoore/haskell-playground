module ChoiceSpec where

import Test.Hspec
import Control.Applicative

spec :: Spec
spec = do

  describe "<|>" $ do
    it "returns the first Just" $ do
      Nothing <|> Just 1 `shouldBe` Just 1

    it "can also be applied to multiple monads" $ do
      Nothing <|> Just 1 <|> Just 2 <|> Just 3 `shouldBe` Just 1
