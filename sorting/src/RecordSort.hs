module RecordSort
where

import Data.List

data Person = Person {
  firstName :: String,
  lastName :: String
} deriving (Eq, Show)

people :: [Person]
people = [ Person "Matt" "Moore"
         , Person "Wyatt" "Earp"
         , Person "John" "Doe"
         , Person "Grace" "Hopper"
         , Person "Ada" "Lovelace" ]

sortWithLambda =
  sortBy
    (\a b -> compare [firstName a, lastName a] [firstName b, lastName b])
    people

sortWithFunction =
  sortBy sortPeople people

sortPeople :: Person -> Person -> Ordering
sortPeople a b
  | (firstName a) < (firstName b) = LT
  | (firstName a) == (firstName b) = EQ
  | otherwise = GT
