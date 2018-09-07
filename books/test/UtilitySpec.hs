{-# LANGUAGE OverloadedStrings #-}

module UtilitySpec where

import Test.Hspec
import Utility
import Author
import Book

spec :: Spec
spec = do

  describe "getFileName" $ do
    it "takes a list of arguments and returns the filename" $ do
      let args = ["programname", "file.txt"]
      (getFileName args) `shouldBe` "file.txt"

  describe "fetchBookData" $ do
    it "takes a file path and converts the file contents to a list of Book records" $ do
      let books = [ Book "Harry Potter and the Philosopher's Stone" $ Author "J. K." "Rowling" 1965
                  , Book "1984" $ Author "George" "Orwell" 1903 ]
      results <- fetchBookData "books_test.json"
      results `shouldBe` books
