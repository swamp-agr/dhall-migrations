-- Haskell type

import Dhall

newtype Milliseconds = Milliseconds { ms :: Natural }
  deriving (Eq, Show, Generic, FromJSON, FromDhall)

data Settings = Settings
  { appHostname :: String
  , appPort :: Natural
  , appClientTimeout :: Milliseconds
  } deriving (Eq, Show, Generic, FromJSON, FromDhall)

-- Dhall type

{ appHostName : Text
, appPort : Natural
, appClientTimeout : { ms : Natural }
}

-- Dhall config

{ appHostname = "example.com"
, appPort = 80
, appClientTimeout = { ms = 5 * 1000 }
}
