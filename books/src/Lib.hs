module Lib
where

import Data.Csv.Parser
import Data.List
import Data.List.Split

data Author = Author {
  firstName :: String,
  lastName  :: String
} deriving (Eq, Show)

data Book = Book {
  title  :: String,
  author :: Author
} deriving (Eq, Show)

formatBooks :: [Book] -> String
formatBooks =
  intercalate "\n" . map formatBook

formatBook :: Book -> String
formatBook book =
  intercalate " by " [title book, formatAuthor (author book)]

formatAuthor :: Author -> String
formatAuthor author =
  intercalate ", " [lastName author, firstName author]

formatAuthors :: [Author] -> String
formatAuthors =
  intercalate "\n" . map formatAuthor

cleanLine ::String -> String
cleanLine =
  intercalate " "
  . reverse
  . tail
  . reverse
  . splitOn " "

parseBook :: String -> Book
parseBook string =
  Book title $ Author (firstName author) (lastName author)
  where
    record = splitOn " by " $ cleanLine string
    title = head record
    author = parseAuthor $ head $ tail record

parseAuthor :: String -> Author
parseAuthor string =
  Author firstName lastName
  where
    record = splitOn " " string
    reversedRecord = reverse record
    lastName = head reversedRecord
    firstName = intercalate " " . reverse . tail $ reversedRecord

parseBooks :: String -> [Book]
parseBooks =
  map parseBook . lines

fetchBookData :: String -> IO [Book]
fetchBookData path = do
  content <- readFile path
  return $ parseBooks content

getFileName :: [String] -> String
getFileName =
  head . tail
