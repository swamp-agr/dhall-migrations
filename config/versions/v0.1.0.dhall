let previous = ./v0.0.dhall

let types               = ./v0.1.0/types.dhall
let migrateFromPrevious = ./v0.1.0/migrate.dhall

-- | Migrate from any version to current one.
let migrateFrom
  =  \(oldSettings : Type)
  -> \(migrate : oldSettings -> types.previous.latest.Settings)
  -> \(old : oldSettings)
  -> migrateFromPrevious (migrate old)
  
let identity = \(t : Type) -> \(x : t) -> x

in
  { unstable = identity types.latest.Settings
  , v_0_1_0  = identity types.latest.Settings
  , v_0_0    = migrateFrom types.v_0_0.Settings previous.v_0_0
  }
 
