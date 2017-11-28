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
  , SYSTEMD
  ) where

import Control.Monad.Eff (Eff, kind Effect)
import Control.Monad.Eff.Uncurried (EffFn3, runEffFn3, EffFn1, runEffFn1)
import Prelude (Unit)

foreign import data Journald ∷ Type
foreign import data SYSTEMD ∷ Effect

foreign import journaldImpl ∷ ∀ a eff. EffFn1 (systemd ∷ SYSTEMD| eff) (Record a) Journald

journald ∷ forall eff a. Record a -> Eff (systemd :: SYSTEMD | eff) Journald
journald = runEffFn1 journaldImpl

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

foreign import emergImpl ∷ ∀ a eff. EffFn3 (systemd :: SYSTEMD | eff) Journald String (Record a) Unit
foreign import alertImpl ∷ ∀ a eff. EffFn3 (systemd :: SYSTEMD | eff) Journald String (Record a) Unit
foreign import critImpl ∷ ∀ a eff. EffFn3 (systemd :: SYSTEMD | eff) Journald String (Record a) Unit
foreign import errImpl ∷ ∀ a eff. EffFn3 (systemd :: SYSTEMD | eff) Journald String (Record a) Unit
foreign import warningImpl ∷ ∀ a eff. EffFn3 (systemd :: SYSTEMD | eff) Journald String (Record a) Unit
foreign import noticeImpl ∷ ∀ a eff. EffFn3 (systemd :: SYSTEMD | eff) Journald String (Record a) Unit
foreign import infoImpl ∷ ∀ a eff. EffFn3 (systemd :: SYSTEMD | eff) Journald String (Record a) Unit
foreign import debugImpl ∷ ∀ a eff. EffFn3 (systemd :: SYSTEMD | eff) Journald String (Record a) Unit

emerg ∷ forall eff a. Journald -> String -> Record a -> Eff (systemd :: SYSTEMD | eff) Unit
emerg = runEffFn3 emergImpl

alert ∷ forall eff a. Journald -> String -> Record a -> Eff (systemd :: SYSTEMD | eff) Unit
alert = runEffFn3 alertImpl

crit ∷ forall eff a. Journald -> String -> Record a -> Eff (systemd :: SYSTEMD | eff) Unit
crit = runEffFn3 critImpl

err ∷ forall eff a. Journald -> String -> Record a -> Eff (systemd :: SYSTEMD | eff) Unit
err = runEffFn3 errImpl

warning ∷ forall eff a. Journald -> String -> Record a -> Eff (systemd :: SYSTEMD | eff) Unit
warning = runEffFn3 warningImpl

notice ∷ forall eff a. Journald -> String -> Record a -> Eff (systemd :: SYSTEMD | eff) Unit
notice = runEffFn3 noticeImpl

info ∷ forall eff a. Journald -> String -> Record a -> Eff (systemd :: SYSTEMD | eff) Unit
info = runEffFn3 infoImpl

debug ∷ forall eff a. Journald -> String -> Record a -> Eff (systemd :: SYSTEMD | eff) Unit
debug = runEffFn3 debugImpl

