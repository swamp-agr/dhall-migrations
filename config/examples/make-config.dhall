-- make-config.dhall

let makeConfig
    : Text -> { appHostname : Text, appPort : Natural }
    = \(host : Text)
    -> { appHostname = host
       , appPort = 80
       }
in makeConfig
