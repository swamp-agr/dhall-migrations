{ appClient =
    { serviceEnabled =
        True
    , serviceEndpoint =
        "https://external.service.io/awesome/api/configurable/endpoint"
    , serviceName =
        "HTTP Client"
    , serviceResponseTimeout =
        Some { ms = 30000000 }
    }
, appDbConnectionString =
    "localhost:default:5432"
, appEnvironment =
    < Development | Production | Staging >.Production
, appHostname =
    "example.com"
, appPort =
    80
}
