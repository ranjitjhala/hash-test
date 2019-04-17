{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

-- module Main (main) where

import           Options.Applicative.Simple (simpleVersion)
import qualified Paths_hash_test as Meta
import qualified Language.Haskell.TH.Syntax as TH
import           Language.Haskell.TH (Q, Exp)
import           GitHash
import           Data.Version
import           IVersion

main :: IO ()
main = do 
  if not True 
     then putStrLn $(mySimpleVersion Meta.version) -- Works
     else putStrLn $(simpleVersion Meta.version)   -- Doesn't work
