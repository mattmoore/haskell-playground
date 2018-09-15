{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE FlexibleInstances #-}

module Lib where

import Data.List

-- This is how records are represented in Haskell. You can think of them as
--   similar to how classes work in OOP: they can store data in fields.
-- Unlike objects in OOP, these are immutable and you cannot attach methods to them.
-- Here we define a Person record with 2 fields: firstName and lastName.
data Person = Person {
  firstName :: String,
  lastName :: String
} deriving (Eq, Show)

-- We want to write a function `formatPerson` that takes a person record and
--   returns a string representation of it.
-- However, we want the function to be able to accept either a Person type, or a
--   String type just containing the name. This is one way we achieve
--   polymorphism in Haskell.
-- Now let's write a type class to enable polymorphism.
class PersonFormatter a where
  formatPerson :: a -> String

-- Now that we have just defined an ad-hoc polymorphic declaration.
-- Let's define the first variant for Person type.
instance PersonFormatter Person where
  formatPerson p = intercalate " " [firstName p, lastName p]

-- What if we just pass a String to `formatPerson`? In this case, we just want
--   to return the value untouched. Let's define that behavior:
instance PersonFormatter String where
  formatPerson n = n

-- Note that in order for matching on String or other built-in types to work,
--   we have to enable FlexibleInstances for the compiler. This is because the
--   compiler normally protects these types to avoid overlapping definitions.
