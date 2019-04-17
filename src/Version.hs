{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import           Options.Applicative.Simple (simpleVersion)
import qualified Paths_hash_test as Meta
import qualified Language.Haskell.TH.Syntax as TH
import           Language.Haskell.TH (Q, Exp)
import           GitHash
import           Data.Version
import           IVersion

main :: IO ()
main = putStrLn $(mySimpleVersion Meta.version)

panic :: String -> IO ()
panic msg = putStrLn panicMsg
  where panicMsg =
          concat [ "[panic ", giBranch gi, "@", giHash gi
                 , " (", giCommitDate gi, ")"
                 , " (", show (giCommitCount gi), " commits in HEAD)"
                 , dirty, "] ", msg ]
        dirty | giDirty gi = " (uncommitted files present)"
              | otherwise   = ""
        gi = $$tGitInfoCwd

