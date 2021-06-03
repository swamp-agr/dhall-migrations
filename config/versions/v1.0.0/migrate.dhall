let types = ./types.dhall
let previous = types.previous.latest
let new = types.latest

let migrateSettings : previous.Settings -> new.Settings
  = \(old : previous.Settings)
  -> { appHostname = old.appHostname
     , appPort = old.appPort
     , appEnvironment = new.Environment.Development
     , appClient =
         { serviceName = "HTTP Client"
         , serviceEnabled = True
         , serviceResponseTimeout = old.appClientTimeout
         , serviceEndpoint =
             "https://external.service.io/awesome/api/some/configurable/endpoint"
         }
     , appEmailTo = [] : List Text
     }
in migrateSettings
