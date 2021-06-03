-- example-with-override.dhall

./make-config.dhall "example.com"
  // { appPort = 443 }

-- { appHostname = "example.com", appPort = 80 }
