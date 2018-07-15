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

foreign import data Journald ∷ Type
foreign import journaldImpl ∷ ∀ a. EffectFn1 (Record a) Journald

journald ∷ forall a. Record a → Effect Journald
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

foreign import emergImpl ∷ ∀ a. EffectFn3 Journald String (Record a) Unit
foreign import alertImpl ∷ ∀ a. EffectFn3 Journald String (Record a) Unit
foreign import critImpl ∷ ∀ a. EffectFn3 Journald String (Record a) Unit
foreign import errImpl ∷ ∀ a. EffectFn3 Journald String (Record a) Unit
foreign import warningImpl ∷ ∀ a. EffectFn3 Journald String (Record a) Unit
foreign import noticeImpl ∷ ∀ a. EffectFn3 Journald String (Record a) Unit
foreign import infoImpl ∷ ∀ a. EffectFn3 Journald String (Record a) Unit
foreign import debugImpl ∷ ∀ a. EffectFn3 Journald String (Record a) Unit

emerg ∷ ∀ a. Journald → String → Record a → Effect Unit
emerg = runEffectFn3 emergImpl

alert ∷ ∀ a. Journald → String → Record a → Effect Unit
alert = runEffectFn3 alertImpl

crit ∷ ∀ a. Journald → String → Record a → Effect Unit
crit = runEffectFn3 critImpl

err ∷ ∀ a. Journald → String → Record a → Effect Unit
err = runEffectFn3 errImpl

warning ∷ ∀ a. Journald → String → Record a → Effect Unit
warning = runEffectFn3 warningImpl

notice ∷ ∀ a. Journald → String → Record a → Effect Unit
notice = runEffectFn3 noticeImpl

info ∷ ∀ a. Journald → String → Record a → Effect Unit
info = runEffectFn3 infoImpl

debug ∷ ∀ a. Journald → String → Record a → Effect Unit
debug = runEffectFn3 debugImpl
