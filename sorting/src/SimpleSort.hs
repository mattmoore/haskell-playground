module SimpleSort
where

import Data.List

sortSimpleNumbersAscending :: [Int] -> [Int]
sortSimpleNumbersAscending = sort

sortSimpleNumbersDescending :: [Int] -> [Int]
sortSimpleNumbersDescending = reverse . sort
