module MyMaybe where

import           Control.Applicative
import           Control.Monad       (ap, liftM)

data MyMaybe a = MyJust a | MyNothing deriving (Eq, Show)

instance Functor MyMaybe where
  fmap = liftM

instance Applicative MyMaybe where
  pure = return
  (<*>) = ap

instance Monad MyMaybe where
  return         = MyJust
  (MyJust x) >>= f = f x
  MyNothing  >>= f = MyNothing

monadicJust :: MyMaybe Integer
monadicJust = MyJust 5

monadicNothing :: MyMaybe Integer
monadicNothing = MyNothing
