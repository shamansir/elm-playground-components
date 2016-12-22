module Components exposing (..)

{-| This module provides the visual representation
for different types of values. It could be used in the Playground-like
Editors.

# List of the available components
@docs stringComponent, numComponent

-}

import Html exposing (..)

{-| Component for a `String`

Usage:
    stringComponent "foobar"
-}
stringComponent : String -> Html a
stringComponent str =
    span [] [ text str ]

{-| Component for a `String`

Usage:
    numComponent 42
-}
numComponent : Int -> Html a
numComponent num =
    span [] [ text (toString num) ]
