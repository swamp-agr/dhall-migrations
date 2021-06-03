let allTypes    = ../versions/v1.1.0/types.dhall
let allVersions = ../versions/v1.1.0.dhall

let types       = allTypes.v_1_0_0
in  allVersions.v_1_0_0

{ appHostname = "example.com"
, appPort = 80
, appEnvironment = types.Environment.Production
, appClient =
    { serviceName = "HTTP Client"
    , serviceEnabled = True
    , serviceResponseTimeout = { ms = 30 * 1000 * 1000 }
    , serviceEndpoint =
        "https://external.service.io/awesome/api/configurable/endpoint"
    }
, appEmailTo = [ "admin@example.com" ] : List Text
}
