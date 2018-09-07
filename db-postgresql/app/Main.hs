{-# LANGUAGE OverloadedStrings #-}

module Main where

import Lib

main = do
  users <- getUsers
  mapM_ print users
