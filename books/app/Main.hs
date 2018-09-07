{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Author
import           Book
import           Data.Text.IO       as TextIO (putStrLn)
import           Query
import           System.Environment
import           Utility

main :: IO ()
main = do
  args <- getArgs
  books <- fetchBookData $ getFileName args

  TextIO.putStrLn "Top 15 authors by last name:"
  TextIO.putStrLn "============================"
  TextIO.putStrLn . formatAuthors . (top15AuthorsByLastName 15) $ books

  TextIO.putStrLn "\nAuthors from 1900s:"
  TextIO.putStrLn "==================="
  TextIO.putStrLn . formatAuthors . authorsFrom1900s $ books
