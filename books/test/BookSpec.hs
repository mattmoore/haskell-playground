{-# LANGUAGE OverloadedStrings #-}

module BookSpec where

import           Author
import           Book
import           Test.Hspec

spec :: Spec
spec = do

  describe "BookSpec" $ do

    describe "formatBook" $ do
      it "transforms a Book record to string representation" $ do
        let book = Book "Harry Potter and the Philosopher's Stone" $ Author { firstName = "J. K.", lastName = "Rowling", birthYear = 1965 }
            bookString = "Harry Potter and the Philosopher's Stone by Rowling, J. K."
        (formatBook book) `shouldBe` bookString

    describe "formatBooks" $ do
      it "transforms a list of Book records to string representation" $ do
        let books = [ Book "Harry Potter and the Philosopher's Stone" $ Author { firstName = "J. K.", lastName = "Rowling", birthYear = 1965 }
                    , Book "1984" $ Author { firstName = "George", lastName = "Orwell", birthYear = 1903 } ]
            bookString = "Harry Potter and the Philosopher's Stone by Rowling, J. K.\n1984 by Orwell, George"
        (formatBooks books) `shouldBe` bookString
