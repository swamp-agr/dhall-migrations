let previous = ../v1.0.0/types.dhall
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
in previous
  // { v_1_1_0 = latest
     , latest   = latest
     , previous = previous
     }
