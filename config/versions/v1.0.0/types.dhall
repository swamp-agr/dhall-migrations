let previous = ../v0.1.0/types.dhall
let Environment = < Development | Staging | Production >
let ClientService =
      { serviceName : Text
      , serviceEnabled : Bool
      , serviceResponseTimeout : { ms : Natural }
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
      , appEmailTo : List Text
      }
  }
in previous
  // { v_1_0_0   = latest
     , latest   = latest
     , previous = previous
     }
