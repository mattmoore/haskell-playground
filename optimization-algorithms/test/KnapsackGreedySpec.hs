module KnapsackGreedySpec where

import           Data.List
import           Food
import           KnapsackGreedy
import           Test.Hspec

spec :: Spec
spec = do

  describe "greedy" $ do
    let burger = Food { name = "Burger", value = 20, cost = 2, calories = 200 }
    let tomato = Food { name = "Tomato", value = 10, cost = 1, calories = 50 }
    let sushi = Food { name = "Sushi", value = 30, cost = 8, calories = 600 }
    let foods = [burger, tomato, sushi]

    context "by cost" $ do
      let sortFunction = (\a b -> compare (cost b) (cost a))
      let constraints = [ (\food taken -> sumField taken cost + cost food <= 3)
                        , (\food taken -> sumField taken calories + calories food <= 850) ]
      let result = greedy foods constraints sortFunction
      let expected = [burger, tomato]
      it "optimizes for cost" $ do
        result `shouldBe` expected

    context "by value" $ do
      let sortFunction = (\a b -> compare (value b) (value a))
      let constraints = [ (\food taken -> totalCost taken + cost food <= 11) ]
      let result = greedy foods constraints sortFunction
      let expected = [sushi, burger, tomato]
      it "optimizes for value" $ do
        result `shouldBe` expected
