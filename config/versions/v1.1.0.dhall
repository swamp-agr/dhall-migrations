let previous = ./v1.0.0.dhall

let types               = ./v1.1.0/types.dhall
let migrateFromPrevious = ./v1.1.0/migrate.dhall

-- | Migrate from any version to latest.
let migrateFrom
  = \(oldSettings : Type)
  -> \(migrate : oldSettings -> types.previous.latest.Settings)
  -> \(old : oldSettings)
  -> migrateFromPrevious (migrate old)

let identity = \(t : Type) -> \(x : t) -> x

in
  { v_1_1_0  = identity types.latest.Settings
  , v_1_0_0  = migrateFrom types.v_1_0_0.Settings previous.v_1_0_0
  , v_0_1_0  = migrateFrom types.v_0_1_0.Settings previous.v_0_1_0
  , v_0_0    = migrateFrom types.v_0_0.Settings   previous.v_0_0
  }
