module Library
    ( books
    , booksToString
    ) where

import Data.List
import Data.Csv.Parser

data Author = Author {
  firstName :: String,
  lastName  :: String
} deriving (Eq, Show)

data Book = Book {
  title  :: String,
  author :: Author
} deriving (Eq, Show)

books :: [Book]
books =
  [
    (Book "Book 1" (Author "Jane" "Doe")),
    (Book "Book 2" (Author "John" "Doe"))
  ]

booksToString :: String
booksToString = intercalate "\n" (map bookToString books)

bookToString :: Book -> String
bookToString book = intercalate " by " [title book, authorToString (author book)]

authorToString :: Author -> String
authorToString author = intercalate " " [firstName author, lastName author]
