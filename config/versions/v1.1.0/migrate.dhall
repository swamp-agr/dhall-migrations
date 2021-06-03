let types = ./types.dhall
let previous = types.previous.latest
let new = types.latest

let migrateClientService : previous.ClientService -> new.ClientService
  = \(old : previous.ClientService)
  -> old // { serviceResponseTimeout = Some old.serviceResponseTimeout }

let migrateSettings : previous.Settings -> new.Settings
  = \(old : previous.Settings)
  -> { appHostname = old.appHostname
     , appPort = old.appPort
     , appEnvironment = old.appEnvironment
     , appClient = migrateClientService old.appClient
     , appDbConnectionString = "localhost:default:5432"
     }
in migrateSettings
