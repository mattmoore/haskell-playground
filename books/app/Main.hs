module Main where

import Author
import Book
import Data.Text.IO as TextIO (putStrLn)
import System.Environment
import Query
import Utility

main :: IO ()
main = do
  args <- getArgs
  books <- fetchBookData $ getFileName args
  TextIO.putStrLn . formatAuthors . top15AuthorsByLastName $ books
