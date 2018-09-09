{-# LANGUAGE OverloadedStrings #-}

module RecordSortSpec where

import Test.Hspec
import RecordSort

spec :: Spec
spec = do

  describe "sortWithLambda" $ do
    it "sorts using a lambda" $ do
      let expected = [ Person "Ada" "Lovelace"
                     , Person "Grace" "Hopper"
                     , Person "John" "Doe"
                     , Person "Matt" "Moore"
                     , Person "Wyatt" "Earp" ]
      shouldBe (sortWithLambda) expected

  describe "sortWithFunction" $ do
    it "sorts using a function" $ do
      let expected = [ Person "Ada" "Lovelace"
                     , Person "Grace" "Hopper"
                     , Person "John" "Doe"
                     , Person "Matt" "Moore"
                     , Person "Wyatt" "Earp" ]
      shouldBe (sortWithFunction) expected
