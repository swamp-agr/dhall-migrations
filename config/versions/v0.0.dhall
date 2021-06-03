let types = ./v0.0/types.dhall
let identity = \(t : Type) -> \(x : t) -> x
in
  { v_0_0 = identity types.latest.Settings
  }
