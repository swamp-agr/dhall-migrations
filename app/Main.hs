{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
module Main where

import Data.Aeson (FromJSON)
import Data.Yaml
import Dhall
import GHC.Generics (Generic)

newtype Milliseconds = Milliseconds { ms :: Natural }
  deriving (Eq, Show, Generic, FromJSON, FromDhall)

data SettingsV1 = SettingsV1
  { appHostname :: String
  , appPort :: Natural
  , appClientTimeout :: Milliseconds
  } deriving (Eq, Show, Generic, FromJSON, FromDhall)

loadYamlSettingsV1 :: IO (Either ParseException SettingsV1)
loadYamlSettingsV1 = decodeFileEither "./config/current/settings.yaml"

showYamlError :: IO ()
showYamlError = do
  yamlSettings <- loadYamlSettingsV1
  case yamlSettings of
    Left err -> putStrLn $ prettyPrintParseException err
    Right settings -> do
      putStrLn $ show settings
      -- ...
      exit

loadSettingsV1 :: IO SettingsV1
loadSettingsV1 = inputFile auto "./config/current/settings.dhall"

data SettingsV2 = SettingsV2
  { appHostname :: String
  , appPort :: Natural
  , appEnvironment :: Environment
  , appClient :: ClientServiceV2
  , appEmailTo :: [String]
  } deriving (Eq, Show, Generic, FromDhall)

data Environment = Development | Staging | Production
  deriving (Eq, Show, Generic, FromDhall)

data ClientServiceV2 = ClientServiceV2
  { serviceName :: String
  , serviceEnabled :: Bool
  , serviceResponseTimeout :: Milliseconds
  , serviceEndpoint :: String
  } deriving (Eq, Show, Generic, FromDhall)

loadSettingsV2 :: IO SettingsV2
loadSettingsV2 = inputFile auto "./config/current/settings.dhall"

data SettingsV3 = SettingsV3
  { appHostname :: String
  , appPort :: Natural
  , appEnvironment :: Environment
  , appClient :: ClientServiceV3
  , appDbConnectionString :: String
  } deriving (Eq, Show, Generic, FromDhall)

data ClientServiceV3 = ClientServiceV3
  { serviceName :: String
  , serviceEnabled :: Bool
  , serviceResponseTimeout :: Maybe Milliseconds
  , serviceEndpoint :: String
  } deriving (Eq, Show, Generic, FromDhall)

loadSettings :: IO SettingsV3
loadSettings = inputFile auto "./config/current/settings.dhall"

main :: IO ()
main = do
  settings <- loadSettings
  putStrLn $ show settings
  -- ...
  exit

exit :: IO ()
exit = pure ()
