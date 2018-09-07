module Query where

import Author
import Book
import Data.List

top15AuthorsByLastName :: [Book] -> [Author]
top15AuthorsByLastName =
  take 15
  . sortBy (\a b -> compare [lastName a, firstName a]
                            [lastName b, firstName b])
  . nub
  . map author
