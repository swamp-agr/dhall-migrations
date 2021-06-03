-- example-with-type.dhall

  { appHostname = "example.com", appPort = 80 }
: { appHostname : Text, appPort : Natural }
