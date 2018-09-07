module Main where

import Data.List
import Lib
import System.Environment

main :: IO ()
main = do
  args <- getArgs
  books <- fetchBookData $ getFileName args
  putStrLn . formatAuthors . top15AuthorsByLastName $ books

top15AuthorsByLastName :: [Book] -> [Author]
top15AuthorsByLastName =
  take 15
  . nub
  . sortBy (\a b -> compare [lastName a, firstName a]
                            [lastName b, firstName b])
  . map author
