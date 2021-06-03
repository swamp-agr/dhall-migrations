-- Haskell types

data Settings = Settings
  { appHostname :: String
  , appPort :: Natural
  , appEnvironment :: Environment
  , appClient :: ClientService
  , appEmailTo :: [String]
  } deriving (Eq, Show, Generic, FromDhall)

data Environment = Development | Staging | Production
  deriving (Eq, Show, Generic, FromDhall)

data ClientService = ClientService
  { serviceName :: String
  , serviceEnabled :: Bool
  , serviceResponseTimeout :: Milliseconds
  , serviceEndpoint :: String
  } deriving (Eq, Show, Generic, FromDhall)

-- Dhall types

let Environment = < Development | Staging | Production >
let ClientService =
      { serviceName : Text
      , serviceEnabled : Bool
      , serviceResponseTimeout : { ms : Natural }
      , serviceEndpoint : Text
      }
in
  { Environment = Environment
  , ClientService = ClientService
  , Settings =
      { appHostname : Text
      , appPort : Natural
      , appEnvironment : Environment
      , appClient : ClientService
      , appEmailTo : List Text
      }
  }

-- Dhall config
let types = ./types.dhall
in

{ appHostname = "example.com"
, appPort = 8000
, appEnvironment = types.Environment.Development
, appClient =
    { serviceName = "HTTP Client"
    , serviceEnabled = True
    , serviceResponseTimeout = { ms = 1 * 1000 * 1000 }
    , serviceEndpoint =
        "https://external.service.io/awesome/api/some/configurable/endpoint"
    }
, appEmailTo = [] : List Text
}

