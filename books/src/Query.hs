module Query where

import           Author
import           Book
import           Data.List

class Query a where
  authorsFrom1900s :: [a] -> [Author]
  top15AuthorsByLastName :: Int -> [a] -> [Author]

instance Query Author where
  authorsFrom1900s = filter (\author -> birthYear author >= 1900)
  top15AuthorsByLastName limit authors =
    take limit
    . sortBy (\a b -> compare [lastName a, firstName a] [lastName b, firstName b])
    . nub
    $ authors

instance Query Book where
  authorsFrom1900s = authorsFrom1900s . map author
  top15AuthorsByLastName limit authors = (top15AuthorsByLastName limit) . map author $ authors
