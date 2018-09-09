{-# LANGUAGE OverloadedStrings #-}

module SimpleSortSpec where

import Test.Hspec
import SimpleSort

spec :: Spec
spec = do

  describe "sortSimpleNumbersAscending" $ do
    it "sorts numbers in ascending order" $ do
      let numbers  = [10, 3, 4, 1, 5, 8, 2, 9, 7, 6]
      let expected = [1..10]
      shouldBe (sortSimpleNumbersAscending numbers) expected

  describe "sortSimpleNumbersDescending" $ do
    it "sorts numbers in descending order" $ do
      let numbers  = [10, 3, 4, 1, 5, 8, 2, 9, 7, 6]
      let expected = reverse [1..10]
      shouldBe (sortSimpleNumbersDescending numbers) expected
