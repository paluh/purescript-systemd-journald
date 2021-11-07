module Test.Main where

import Prelude
import Effect (Effect)
import Node.Systemd.Journald (journald, debug)

data Custom
  = Empty
  | NonEmpty Int

main :: Effect Unit
main = do
  logger <- journald { syslog_identifier: "purescript-systemd-journald-tests" }
  let
    fields =
      { _ignored: "top"
      , something:
          { how: "how"
          , would: 888
          , journald: \_ -> "some unicode: λ"
          , store: "store"
          , these: NonEmpty 8
          , values: Empty
          , _nonignored: "nested"
          }
      }
  debug logger "Test message" fields
