{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

-- module Main (main) where

import System.Environment
import           Options.Applicative.Simple (simpleVersion)
import qualified Paths_hash_test as Meta
import qualified Language.Haskell.TH.Syntax as TH
import           Language.Haskell.TH (Q, Exp)
import           GitHash
import           Data.Version
import           IVersion

main :: IO ()
main = do 
  args <- getArgs 
  let nArgs = read <$> args
  case nArgs :: [Int] of 
    0:_ -> putStrLn $(mySimpleVersion Meta.version) -- Works
    _   -> putStrLn $(simpleVersion Meta.version)   -- Doesn't work
