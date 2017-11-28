module Test.Main where

import Prelude
import Control.Monad.Eff (Eff)

import Node.Systemd.Journald (journald, debug, alert, SYSTEMD)

data Custom = Empty | NonEmpty Int

main :: forall e. Eff (systemd ∷ SYSTEMD | e) Unit
main = do
  logger ← journald { syslog_identifier: "purescript-systemd-journald-tests"  }
  let
    fields =
      { _ignored: "top"
      , something:
        { how: "how"
        , would: 888
        , journald: \x → "some unicode: λ"
        , store: "store"
        , these: NonEmpty 8
        , values: Empty
        , _nonignored: "nested"
        }
      }
  debug logger "Test message" fields
