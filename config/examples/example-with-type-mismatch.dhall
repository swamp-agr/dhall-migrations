-- example-with-type-mismatch.dhall

./make-config.dhall 42

{-
Use "dhall --explain" for detailed errors

Error: Wrong type of function argument

- Text
+ Natural

1: (λ(host : Text) → { appHostname = host, appPort = 80 }) 42

(stdin):1:1
-}
