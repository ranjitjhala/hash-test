{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module IVersion where

import           Options.Applicative.Simple (simpleVersion)
import qualified Paths_hash_test as Meta
import qualified Language.Haskell.TH.Syntax as TH
import           Language.Haskell.TH (Q, Exp)
import           GitHash
import           Data.Version


-- | Generate a string like @Version 1.2, Git revision 1234@.
--
-- @$(simpleVersion …)@ @::@ 'String'
mySimpleVersion :: Version -> Q Exp
mySimpleVersion version =
  [|concat (["Version "
           ,$(TH.lift $ showVersion version)
           ] ++
           -- case giResult :: Either String GitInfo of
           --  Left _ -> []
           --  Right gi -> 
              [ ", Git revision "
                         , giHash gi
                         , if giDirty gi then " (dirty)" else ""
              ]
           )|]
  where
    gi = $$tGitInfoCwd
    -- giResult = $$tGitInfoCwdTry
