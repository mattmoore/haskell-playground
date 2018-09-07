{-# LANGUAGE OverloadedStrings #-}

module LibSpec where

import Test.Hspec
import Lib

spec :: Spec
spec = do

  describe "parseBook" $ do
    context "given book data in string format" $ do
      it "generates a Book" $ do
        let bookString = "Harry Potter and the Philosopher's Stone by J. K. Rowling (93,654)"
        shouldBe
          (parseBook bookString)
          (Book "Harry Potter and the Philosopher's Stone" (Author "J. K." "Rowling"))

  describe "parseBooks" $ do
    context "given a list of book data in string format" $ do
      it "generates a Book" $ do
        let bookString = "Harry Potter and the Philosopher's Stone by J. K. Rowling (93,654)\n1984 by George Orwell (58,522)"
        shouldBe
          (parseBooks bookString)
          [ Book "Harry Potter and the Philosopher's Stone" $ Author "J. K." "Rowling"
          , Book "1984"                                     $ Author "George" "Orwell"
          ]
