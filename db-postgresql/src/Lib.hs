{-# LANGUAGE OverloadedStrings #-}

module Lib where

import Control.Monad
import Control.Applicative
import qualified Data.Text as Text
import Database.PostgreSQL.Simple
import Database.PostgreSQL.Simple.FromRow

data User = User {
  id        :: Maybe Int,
  firstName :: Maybe String,
  lastName  :: Maybe String
} deriving Show

userQuery = "SELECT id, first_name, last_name FROM users"

instance FromRow User where
  fromRow = User
        <$> field
        <*> field
        <*> field

connection = do
  conn <- connect defaultConnectInfo {
    connectDatabase = "mpm"
  }
  pure conn

getUsers = do
  conn <- connection
  results <- query_ conn userQuery :: IO [User]
  close conn
  pure results
