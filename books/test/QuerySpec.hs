{-# LANGUAGE OverloadedStrings #-}

module QuerySpec where

import Test.Hspec
import Author
import Query
import Utility

spec :: Spec
spec = do

  describe "top15AuthorsByLastName" $ do
    it "gets the top 15 unique authors sorted by last name" $ do
      books <- fetchBookData "books.json"
      let expectedAuthors = [ Author { lastName = "Adams"      , firstName = "Douglas"         , birthYear = 1952 }
                            , Author { lastName = "Atwood"     , firstName = "Margaret"        , birthYear = 1939 }
                            , Author { lastName = "Austen"     , firstName = "Jane"            , birthYear = 1775 }
                            , Author { lastName = "Bradbury"   , firstName = "Ray"             , birthYear = 1920 }
                            , Author { lastName = "Brontë"     , firstName = "Charlotte"       , birthYear = 1816 }
                            , Author { lastName = "Brontë"     , firstName = "Emily"           , birthYear = 1818 }
                            , Author { lastName = "Brown"      , firstName = "Dan"             , birthYear = 1964 }
                            , Author { lastName = "Burnett"    , firstName = "Frances Hodgson" , birthYear = 1849 }
                            , Author { lastName = "Camus"      , firstName = "Albert"          , birthYear = 1913 }
                            , Author { lastName = "Card"       , firstName = "Orson Scott"     , birthYear = 1951 }
                            , Author { lastName = "Clare"      , firstName = "Cassandra"       , birthYear = 1973 }
                            , Author { lastName = "Clarke"     , firstName = "Susanna"         , birthYear = 1959 }
                            , Author { lastName = "Coelho"     , firstName = "Paulo"           , birthYear = 1947 }
                            , Author { lastName = "Collins"    , firstName = "Suzanne"         , birthYear = 1962 }
                            , Author { lastName = "Dickens"    , firstName = "Charles"         , birthYear = 1812 } ]
      (top15AuthorsByLastName books) `shouldBe` expectedAuthors
