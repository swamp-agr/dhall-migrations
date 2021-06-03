-- example-with-type-function.dhall

let identity = \(t : Type) -> \(x : t) -> x in identity Text "ololo"

-- "ololo"

let identity = \(t : Type) -> \(x : t) -> x in identity Text 2

{-
it : Text
identity : ∀(t : Type) → ∀(x : t) → t

Error: Wrong type of function argument

- Text
+ Natural

1:                                                identity Text 2

(stdin):1:48
-}
