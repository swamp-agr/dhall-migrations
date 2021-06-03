-- example-with-function.dhall

let makeConfig : Text -> { appHostname : Text, appPort : Natural }
    = \(host : Text)
    -> { appHostname = host
       , appPort = 80
       }
in makeConfig "example.com"

-- { appHostname = "example.com", appPort = 80 }
