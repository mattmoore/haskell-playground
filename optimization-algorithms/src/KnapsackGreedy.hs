module KnapsackGreedy where

import           Data.List

greedy :: [a] -> [(a -> [a] -> Bool)] -> (a -> a -> Ordering) -> [a]
greedy items constraints sortFunction =
  takeFitItems constraints . sortBy sortFunction $ items
  where
    takeFitItems constraints items = foldr (\x xs -> if fits xs constraints x then x : xs else xs) [] items
    fits taken constraints item = all (\constraint -> constraint item taken) constraints
