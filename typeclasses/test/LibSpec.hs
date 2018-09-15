{-# LANGUAGE FlexibleInstances #-}

module LibSpec where

import Test.Hspec
import Lib

spec :: Spec
spec = do

  describe "formatPerson" $ do

    context "when passed a Person type" $ do
      it "formats a Person record to String" $ do
        (formatPerson $ Person "Matt" "Moore") `shouldBe` "Matt Moore"

    context "when passed a String type" $ do
      it "returns the same String" $ do
        (formatPerson "Matt Moore") `shouldBe` "Matt Moore"
