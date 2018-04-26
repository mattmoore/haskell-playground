module Lib
    ( aggregateData
    ) where

import Control.Concurrent.Async

aggregateData :: [String] -> IO [String]
aggregateData files = mapConcurrently readFile files
