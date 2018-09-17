{-# LANGUAGE OverloadedStrings #-}

module LibSpec where

import           Lib
import           Test.Hspec

spec :: Spec
spec = do

  describe "LibSpec" $ do
    describe "toJson" $ do
      it "marshals Person to ByteString" $ do
        let person = Person "Matt" "Moore"
            json = "{\"lastName\":\"Moore\",\"firstName\":\"Matt\"}"
        (toJson person) `shouldBe` json
    describe "fromJson" $ do
      it "unmarshals ByteString to Person" $ do
        let json = "{\"lastName\":\"Moore\",\"firstName\":\"Matt\"}"
            person = Person "Matt" "Moore"
        (fromJson json) `shouldBe` person
