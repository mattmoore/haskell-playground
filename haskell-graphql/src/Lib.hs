{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators #-}

module Lib where

import Data.Text (Text)
import Data.Monoid ((<>))

import GraphQL
import GraphQL.API
import GraphQL.Resolver (Handler)

type Hello = Object "Hello" '[]
  '[ Argument "who" Text :> Field "greeting" Text
   ]

hello :: Handler IO Hello
hello = pure greeting
  where
    greeting who = pure ("Hello " <> who <> "!")
