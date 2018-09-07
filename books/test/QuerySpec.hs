{-# LANGUAGE OverloadedStrings #-}

module QuerySpec where

import           Author
import           Query
import           Test.Hspec
import           Utility

spec :: Spec
spec = do

  describe "Query" $ do

    describe "topAuthorsByLastName" $ do
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
        (top15AuthorsByLastName 15 books) `shouldBe` expectedAuthors

    describe "authorsFrom1900s" $ do
      it "gets authors from the 1900s" $ do
        books <- fetchBookData "books.json"
        let expectedAuthors = [ Author { firstName = "J. K."          , lastName = "Rowling"          , birthYear = 1965 }
                              , Author { firstName = "J. K."          , lastName = "Rowling"          , birthYear = 1965 }
                              , Author { firstName = "J. K."          , lastName = "Rowling"          , birthYear = 1965 }
                              , Author { firstName = "J. K."          , lastName = "Rowling"          , birthYear = 1965 }
                              , Author { firstName = "J. K."          , lastName = "Rowling"          , birthYear = 1965 }
                              , Author { firstName = "J. K."          , lastName = "Rowling"          , birthYear = 1965 }
                              , Author { firstName = "J. K."          , lastName = "Rowling"          , birthYear = 1965 }
                              , Author { firstName = "J. R. R."       , lastName = "Tolkien"          , birthYear = 1916 }
                              , Author { firstName = "George"         , lastName = "Orwell"           , birthYear = 1903 }
                              , Author { firstName = "Dan"            , lastName = "Brown"            , birthYear = 1964 }
                              , Author { firstName = "Harper"         , lastName = "Lee"              , birthYear = 1926 }
                              , Author { firstName = "J. D."          , lastName = "Salinger"         , birthYear = 1919 }
                              , Author { firstName = "Stephenie"      , lastName = "Meyer"            , birthYear = 1973 }
                              , Author { firstName = "Suzanne"        , lastName = "Collins"          , birthYear = 1962 }
                              , Author { firstName = "Khaled"         , lastName = "Hosseini"         , birthYear = 1965 }
                              , Author { firstName = "George"         , lastName = "Orwell"           , birthYear = 1903 }
                              , Author { firstName = "J. R. R."       , lastName = "Tolkien"          , birthYear = 1916 }
                              , Author { firstName = "Dan"            , lastName = "Brown"            , birthYear = 1964 }
                              , Author { firstName = "J. R. R."       , lastName = "Tolkien"          , birthYear = 1916 }
                              , Author { firstName = "Stephenie"      , lastName = "Meyer"            , birthYear = 1973 }
                              , Author { firstName = "Ray"            , lastName = "Bradbury"         , birthYear = 1920 }
                              , Author { firstName = "Mark"           , lastName = "Haddon"           , birthYear = 1962 }
                              , Author { firstName = "William"        , lastName = "Golding"          , birthYear = 1911 }
                              , Author { firstName = "Yann"           , lastName = "Martel"           , birthYear = 1963 }
                              , Author { firstName = "Stephenie"      , lastName = "Meyer"            , birthYear = 1973 }
                              , Author { firstName = "Kurt"           , lastName = "Vonnegut"         , birthYear = 1922 }
                              , Author { firstName = "Gabriel Garcia" , lastName = "Marquez"          , birthYear = 1927 }
                              , Author { firstName = "Audrey"         , lastName = "Niffenegger"      , birthYear = 1963 }
                              , Author { firstName = "J. R. R."       , lastName = "Tolkien"          , birthYear = 1916 }
                              , Author { firstName = "Stieg"          , lastName = "Larsson"          , birthYear = 1954 }
                              , Author { firstName = "Suzanne"        , lastName = "Collins"          , birthYear = 1962 }
                              , Author { firstName = "J. R. R."       , lastName = "Tolkien"          , birthYear = 1916 }
                              , Author { firstName = "Orson Scott"    , lastName = "Card"             , birthYear = 1951 }
                              , Author { firstName = "Stephenie"      , lastName = "Meyer"            , birthYear = 1973 }
                              , Author { firstName = "Joseph"         , lastName = "Heller"           , birthYear = 1923 }
                              , Author { firstName = "Markus"         , lastName = "Zusak"            , birthYear = 1975 }
                              , Author { firstName = "Arthur"         , lastName = "Golden"           , birthYear = 1956 }
                              , Author { firstName = "Alice"          , lastName = "Sebold"           , birthYear = 1963 }
                              , Author { firstName = "Suzanne"        , lastName = "Collins"          , birthYear = 1962 }
                              , Author { firstName = "George R. R."   , lastName = "Martin"           , birthYear = 1948 }
                              , Author { firstName = "Antoine de"     , lastName = "Saint-Exupéry"    , birthYear = 1900 }
                              , Author { firstName = "Douglas"        , lastName = "Adams"            , birthYear = 1952 }
                              , Author { firstName = "John"           , lastName = "Steinbeck"        , birthYear = 1902 }
                              , Author { firstName = "Margaret"       , lastName = "Atwood"           , birthYear = 1939 }
                              , Author { firstName = "Paulo"          , lastName = "Coelho"           , birthYear = 1947 }
                              , Author { firstName = "Philip"         , lastName = "Pullman"          , birthYear = 1946 }
                              , Author { firstName = "Lois"           , lastName = "Lowry"            , birthYear = 1937 }
                              , Author { firstName = "Frank"          , lastName = "Herbert"          , birthYear = 1920 }
                              , Author { firstName = "Neil"           , lastName = "Gaiman"           , birthYear = 1960 }
                              , Author { firstName = "Cormac"         , lastName = "McCarthy"         , birthYear = 1933 }
                              , Author { firstName = "Albert"         , lastName = "Camus"            , birthYear = 1913 }
                              , Author { firstName = "Madeleine"      , lastName = "L'Engle"          , birthYear = 1918 }
                              , Author { firstName = "John"           , lastName = "Steinbeck"        , birthYear = 1902 }
                              , Author { firstName = "Terry"          , lastName = "Pratchett"        , birthYear = 1948 }
                              , Author { firstName = "J. R. R."       , lastName = "Tolkien"          , birthYear = 1916 }
                              , Author { firstName = "Sara"           , lastName = "Gruen"            , birthYear = 1969 }
                              , Author { firstName = "Khaled"         , lastName = "Hosseini"         , birthYear = 1965 }
                              , Author { firstName = "Christopher"    , lastName = "Paolini"          , birthYear = 1983 }
                              , Author { firstName = "Stieg"          , lastName = "Larsson"          , birthYear = 1954 }
                              , Author { firstName = "Gregory"        , lastName = "Maguire"          , birthYear = 1954 }
                              , Author { firstName = "Jeffrey"        , lastName = "Eugenides"        , birthYear = 1960 }
                              , Author { firstName = "Kathryn"        , lastName = "Stockett"         , birthYear = 1969 }
                              , Author { firstName = "Jack"           , lastName = "Kerouac"          , birthYear = 1922 }
                              , Author { firstName = "Sue Monk"       , lastName = "Kidd"             , birthYear = 1948 }
                              , Author { firstName = "Ian"            , lastName = "McEwan"           , birthYear = 1948 }
                              , Author { firstName = "Susanna"        , lastName = "Clarke"           , birthYear = 1959 }
                              , Author { firstName = "Barbara"        , lastName = "Kingsolver"       , birthYear = 1955 }
                              , Author { firstName = "Carlos Ruiz"    , lastName = "Zafón"            , birthYear = 1964 }
                              , Author { firstName = "Gabriel Garcia" , lastName = "Marquez"          , birthYear = 1927 }
                              , Author { firstName = "George R. R."   , lastName = "Martin"           , birthYear = 1948 }
                              , Author { firstName = "Steven D."      , lastName = "Levitt"           , birthYear = 1967 }
                              , Author { firstName = "Cassandra"      , lastName = "Clare"            , birthYear = 1973 } ]
        (authorsFrom1900s books) `shouldBe` expectedAuthors
