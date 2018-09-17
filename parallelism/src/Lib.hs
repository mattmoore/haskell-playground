module Lib where

import Control.Parallel
import Control.Parallel.Strategies

pmap :: NFData b => (a -> b) -> [a] -> [b]
pmap f xs = map f xs `using` parList rdeepseq
