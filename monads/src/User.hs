module User where

import           Data.Decimal
import           Transaction

data User = User {
  id           :: Integer,
  firstName    :: String,
  lastName     :: String,
  transactions :: [Transaction]
} deriving (Eq, Show)

charge :: User -> Decimal -> IO User
charge user amount =
  return $ User {
    User.id           = (User.id        user),
    User.firstName    = (User.firstName user),
    User.lastName     = (User.lastName  user),
    User.transactions = (Transaction amount) : (transactions user)
  }

balance :: User -> IO Decimal
balance user =
  return . sum . map amount . transactions $ user
