module Lib (merge, fetchFile, fetchFiles ) where

import Control.Exception
import Control.Concurrent.Async
import Data.List

merge :: [String] -> String
merge = intercalate ">>>\n" . filter(/= "")

fetchFiles :: [String] -> IO [String]
fetchFiles = mapConcurrently fetchFile

fetchFile :: String -> IO String
fetchFile x = (try (readFile x) :: IO (Either IOException String))
  >>= return . fileResult

fileResult :: Either IOException String -> String
fileResult (Left  _) = ""
fileResult (Right x) = x
