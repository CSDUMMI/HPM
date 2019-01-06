module Main where

-- StdLib of Haskell
import System.Environment
import Data.List

-- Own Modules
import qualified HPM.Init       as HPM
import qualified HPM.Install    as HPM
import qualified HPM.Build      as HPM

main = do
  args <- getArgs
  callPro args

callPro :: [String] -> IO ()
callPro ("init":args) = HPM.init args
callPro ("install":args) = HPM.install args
callPro (args) = HPM.build args
