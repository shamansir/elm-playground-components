module Components exposing
    ( stringComponent
    , intComponent
    , floatComponent
    , stringListComponent
    , intListComponent
    , floatListComponent
    )

{-| This module provides the visual representation
for different types of values. It could be used in the Playground-like
Editors.

# List of the available components
@docs stringComponent
    , intComponent
    , floatComponent
    , stringListComponent
    , intListComponent
    , floatListComponent
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

{-| Component for an `Int`

Usage:
    intComponent 42
-}
intComponent : Int -> Html a
intComponent num =
    span [ class "number" ] [ text (toString num) ]

{-| Component for a `Float`

Usage:
    floatComponent 42.2
-}
floatComponent : Float -> Html a
floatComponent num =
    span [ class "number" ] [ text (toString num) ]

{-| Component for a `List String`

Usage:
    stringListComponent [ "foo", "bar" ]
-}
stringListComponent : List String -> Html a
stringListComponent stringList =
    listOf stringComponent stringList

{-| Component for a `List Int`

Usage:
    intListComponent [ 10, 12, 15, 55, 60 ]
-}
intListComponent : List Int -> Html a
intListComponent intList =
    listOf intComponent intList

{-| Component for a `List Float`

Usage:
    floatListComponent [ 10.1, 12.2, 15.3, 55.4, 60.5, 111 ]
-}
floatListComponent : List Float -> Html a
floatListComponent floatList =
    listOf floatComponent floatList

listOf : (x -> Html a) -> List x -> Html a
listOf itemProducer items =
    ul [ class "list-of" ]
        (List.map (\item -> li [] [ (itemProducer item) ]) items)
