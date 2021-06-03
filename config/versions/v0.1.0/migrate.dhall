let types = ./types.dhall
let previous = types.previous.latest
let new = types.latest

let migrateSettings : previous.Settings -> new.Settings
  = \(old : previous.Settings)
  -> { appHostname = "example.com"
     , appPort = 80
     , appClientTimeout = { ms = 30 * 1000 * 1000 }
     }
in migrateSettings
