module Main where

import Control.Exception
import Control.Concurrent.Async
import Data.List

main :: IO ()
main = putStrLn . merge =<< fetchFiles
  ["data1.txt",
   "data2.txt",
   "data4.txt",
   "data3.txt"]

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
