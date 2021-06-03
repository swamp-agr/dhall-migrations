-- Haskell types

data Settings = Settings
  { appHostname :: String
  , appPort :: Natural
  , appEnvironment :: Environment
  , appClient :: ClientServiceV3
  , appDbConnectionString :: String
  } deriving (Eq, Show, Generic, FromDhall)

data ClientService = ClientService
  { serviceName :: String
  , serviceEnabled :: Bool
  , serviceResponseTimeout :: Maybe Milliseconds
  , serviceEndpoint :: String
  } deriving (Eq, Show, Generic, FromDhall)

-- Dhall types

let Environment = < Development | Staging | Production >
let ClientService = 
      { serviceName : Text
      , serviceEnabled : Bool
      , serviceResponseTimeout : Optional { ms : Natural } 
      , serviceEndpoint : Text
      }
let latest =
  { Environment = Environment
  , ClientService = ClientService
  , Settings =
      { appHostname : Text
      , appPort : Natural
      , appEnvironment : Environment
      , appClient : ClientService
      , appDbConnectionString : Text
      }
  }

-- Dhall config

{ appClient =
    { serviceEnabled =
        True
    , serviceEndpoint =
        "https://external.service.io/awesome/api/configurable/endpoint"
    , serviceName =
        "HTTP Client"
    , serviceResponseTimeout =
        Some { ms = 30000000 }
    }
, appDbConnectionString =
    "localhost:default:5432"
, appEnvironment =
    < Development | Production | Staging >.Production
, appHostname =
    "example.com"
, appPort =
    80
}
