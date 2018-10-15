module LibSpec where

import Test.Hspec
import Lib

spec :: Spec
spec = do

  describe "Lib" $ do
    describe "applyTransformations" $ do
      it "applies a list of functions to an argument" $ do
        let greet name = "Hello, " ++ name
        let punctuate text = text ++ "."
        let transformations = [greet, punctuate]
        (applyTransformations "Matt" transformations) `shouldBe` "Hello, Matt."
