{-# LANGUAGE OverloadedStrings #-}

module LibSpec where

import Test.Hspec
import Lib

spec :: Spec
spec = do

  describe "Lib" $ do
    describe "pmap" $ do
      it "evaluates a given function over a functor in parallel" $ do
        let values = [1..10000000] :: [Int]
            expectedValues = [x | x <- [1..20000000], even x] :: [Int]
        (pmap (*2) values) `shouldBe` expectedValues
