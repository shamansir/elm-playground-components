module Components exposing
    ( stringComponent
    , numComponent
    , stringListComponent
    )

{-| This module provides the visual representation
for different types of values. It could be used in the Playground-like
Editors.

# List of the available components
@docs stringComponent, numComponent, stringListComponent

-}

import Html exposing (..)
import Html.Attributes exposing (..)

{-| Component for a `String`

Usage:
    stringComponent "foobar"
-}
stringComponent : String -> Html a
stringComponent str =
    span [ class "string" ] [ text str ]

{-| Component for a `Int`

Usage:
    numComponent 42
-}
numComponent : Int -> Html a
numComponent num =
    span [ class "number" ] [ text (toString num) ]

{-| Component for a `List String`

Usage:
    stringListComponent [ "foo" "bar" ]
-}
stringListComponent : List String -> Html a
stringListComponent stringList =
    listOf stringComponent stringList

listOf : (x -> Html a) -> List x -> Html a
listOf itemProducer items =
    ul [ class "list-of" ]
        (List.map (\item -> li [] [ (itemProducer item) ]) items)
