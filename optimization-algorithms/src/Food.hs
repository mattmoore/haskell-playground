{-# LANGUAGE DeriveGeneric #-}

module Food where

import           GHC.Generics

data Food = Food {
  name     :: String,
  value    :: Float,
  cost     :: Float,
  calories :: Float
} deriving (Eq, Show, Generic)

density :: Food -> Float
density food =
  (value food) / (cost food)

totalCost :: [Food] -> Float
totalCost foods =
  foldr (\food total -> (cost food) + total) 0 foods

totalCalories :: [Food] -> Float
totalCalories foods =
  foldr (\food total -> (calories food) + total) 0 foods

sumField :: [Food] -> (Food -> Float) -> Float
sumField foods field =
  foldr (\food total -> field food + total) 0 foods
