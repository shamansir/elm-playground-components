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

type alias StringComponentModel = String

{-| Component for a `String`

Usage:
    stringComponent "foobar"
-}
stringComponent : StringComponentModel -> Html a
stringComponent str =
    span [ class "string" ] [ text str ]

type alias IntComponentModel = Int

{-| Component for an `Int`

Usage:
    intComponent 42
-}
intComponent : IntComponentModel -> Html a
intComponent num =
    span [ class "number int" ] [ text (toString num) ]

type alias FloatComponentModel = Float

{-| Component for a `Float`

Usage:
    floatComponent 42.2
-}
floatComponent : FloatComponentModel -> Html a
floatComponent num =
    span [ class "number float" ] [ text (toString num) ]

type alias StringListComponentModel = List String

{-| Component for a `List String`

Usage:
    stringListComponent [ "foo", "bar" ]
-}
stringListComponent : StringListComponentModel -> Html a
stringListComponent stringList =
    listOf stringComponent stringList

type alias IntListComponentModel = List Int

{-| Component for a `List Int`

Usage:
    intListComponent [ 10, 12, 15, 55, 60 ]
-}
intListComponent : IntListComponentModel -> Html a
intListComponent intList =
    listOf intComponent intList

type alias FloatListComponentModel = List Float

{-| Component for a `List Float`

Usage:
    floatListComponent [ 10.1, 12.2, 15.3, 55.4, 60.5, 111 ]
-}
floatListComponent : FloatListComponentModel -> Html a
floatListComponent floatList =
    listOf floatComponent floatList

listOf : (x -> Html a) -> List x -> Html a
listOf itemProducer items =
    ul [ class "list-of" ]
        (List.map (\item -> li [] [ (itemProducer item) ]) items)
