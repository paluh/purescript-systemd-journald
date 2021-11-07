module Node.Systemd.Journald
  ( alert
  , crit
  , debug
  , emerg
  , err
  , info
  , journald
  , Journald
  , notice
  , warning
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn3, runEffectFn3, EffectFn1, runEffectFn1)
import Prelude (Unit)

foreign import data Journald :: Type
foreign import journaldImpl :: forall a. EffectFn1 (Record a) Journald

journald :: forall a. Record a -> Effect Journald
journald = runEffectFn1 journaldImpl

-- | Journald log levels:
-- |
-- | EMERG    - system is unusable
-- | ALERT    - action must be taken immediately
-- | CRIT     - critical conditions
-- | ERR      - error conditions
-- | WARNING  - warning conditions
-- | NOTICE   - normal but significant condition
-- | INFO     - informational
-- | DEBUG    - debug-level messages

foreign import emergImpl :: forall a. EffectFn3 Journald String (Record a) Unit
foreign import alertImpl :: forall a. EffectFn3 Journald String (Record a) Unit
foreign import critImpl :: forall a. EffectFn3 Journald String (Record a) Unit
foreign import errImpl :: forall a. EffectFn3 Journald String (Record a) Unit
foreign import warningImpl :: forall a. EffectFn3 Journald String (Record a) Unit
foreign import noticeImpl :: forall a. EffectFn3 Journald String (Record a) Unit
foreign import infoImpl :: forall a. EffectFn3 Journald String (Record a) Unit
foreign import debugImpl :: forall a. EffectFn3 Journald String (Record a) Unit

emerg :: forall a. Journald -> String -> Record a -> Effect Unit
emerg = runEffectFn3 emergImpl

alert :: forall a. Journald -> String -> Record a -> Effect Unit
alert = runEffectFn3 alertImpl

crit :: forall a. Journald -> String -> Record a -> Effect Unit
crit = runEffectFn3 critImpl

err :: forall a. Journald -> String -> Record a -> Effect Unit
err = runEffectFn3 errImpl

warning :: forall a. Journald -> String -> Record a -> Effect Unit
warning = runEffectFn3 warningImpl

notice :: forall a. Journald -> String -> Record a -> Effect Unit
notice = runEffectFn3 noticeImpl

info :: forall a. Journald -> String -> Record a -> Effect Unit
info = runEffectFn3 infoImpl

debug :: forall a. Journald -> String -> Record a -> Effect Unit
debug = runEffectFn3 debugImpl
