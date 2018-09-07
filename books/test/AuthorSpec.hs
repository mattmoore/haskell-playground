{-# LANGUAGE OverloadedStrings #-}

module AuthorSpec where

import Test.Hspec
import Author

spec :: Spec
spec = do

  describe "formatAuthor" $ do
    it "transforms Author to string representation" $ do
      let author = Author  { firstName = "J. K.", lastName = "Rowling", birthYear = 1965 }
          authorString = "Rowling, J. K."
      (formatAuthor author) `shouldBe` authorString

  describe "formatAuthors" $ do
    it "transforms Author list to string representation" $ do
      let authors = [ Author { firstName = "J. K.", lastName = "Rowling", birthYear = 1965 }
                    , Author { firstName = "George", lastName = "Orwell", birthYear = 1903 } ]
          authorString = "Rowling, J. K.\nOrwell, George"
      (formatAuthors authors) `shouldBe` authorString
