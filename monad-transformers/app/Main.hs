module Main where

import Lib
import Control.Monad.Trans.Maybe

main :: IO ()
main = do
  let result = case twoFizzBuzzesMaybeT of
                  Nothing     -> "Nothing!"
                  Just (x, y) -> x
    in
      twoFizzBuzzes
      putStrLn result

fizzBuzz :: Int -> IO (Maybe String)
fizzBuzz x
  | x `mod` 3 == 0 && x `mod` 5 == 0 = pure $ Just "FizzBuzz"
  | x `mod` 3 == 0                   = pure $ Just "Fizz"
  | x `mod` 5 == 0                   = pure $ Just "Buzz"
  | otherwise                        = pure $ Nothing

twoFizzBuzzes :: IO ()
twoFizzBuzzes = do
  result <- fizzBuzz 3
  case result of
    Nothing -> putStrLn "First one failed"
    Just x -> do
      putStrLn x
      result2 <- fizzBuzz 5
      case result2 of
        Nothing -> putStrLn "Second one failed"
        Just x -> putStrLn x

fizzBuzzMaybeT :: Int -> MaybeT IO String
fizzBuzzMaybeT x
  | x `mod` 3 == 0 && x `mod` 5 == 0 = MaybeT $ pure $ Just "FizzBuzz"
  | x `mod` 3 == 0                   = MaybeT $ pure $ Just "Fizz"
  | x `mod` 5 == 0                   = MaybeT $ pure $ Just "Buzz"
  | otherwise                        = MaybeT $ pure $ Nothing

twoFizzBuzzesMaybeT :: MaybeT IO ()
twoFizzBuzzesMaybeT = MaybeT $ do
  maybeResult <- runMaybeT $ do
    result <- fizzBuzz 3
    result2 <- fizzBuzz 5
  return (result, result2)
