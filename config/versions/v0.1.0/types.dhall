let previous = ../v0.0/types.dhall
let latest =
  { Settings =
      { appHostname : Text
      , appPort : Natural
      , appClientTimeout : { ms : Natural }
      }
  }
in previous
  // { v_0_1_0  = latest
     , latest   = latest
     , previous = previous
     }
