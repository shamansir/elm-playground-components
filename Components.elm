module Components exposing
    ( stringComponent
    , intComponent
    , floatComponent
    , stringListComponent
    , intListComponent
    , floatListComponent
    , stringTuple1Component
    , stringTuple2Component
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
    , stringTuple1Component
    , stringTuple2Component
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
    span [ class "number int" ] [ text (toString num) ]

{-| Component for a `Float`

Usage:
    floatComponent 42.2
-}
floatComponent : Float -> Html a
floatComponent num =
    span [ class "number float" ] [ text (toString num) ]

type alias ListModel x = (List x, Bool)

type ListMsg = Expand | Collapse

listUpdate : ListMsg -> ListModel x -> ListModel x
listUpdate msg (list, expanded) =
    case msg of
        Expand -> (list, True)
        Collapse -> (list, False)

{-| Component for a `List String`

Usage:
    stringListComponent [ "foo", "bar" ]
-}
stringListComponent : ListModel String -> Html ListMsg
stringListComponent (stringList, expanded) =
    listOf stringComponent stringList

{-| Component for a `List Int`

Usage:
    intListComponent [ 10, 12, 15, 55, 60 ]
-}
intListComponent : ListModel Int -> Html ListMsg
intListComponent (intList, expaned) =
    listOf intComponent intList

{-| Component for a `List Float`

Usage:
    floatListComponent [ 10.1, 12.2, 15.3, 55.4, 60.5, 111 ]
-}
floatListComponent : ListModel Float -> Html ListMsg
floatListComponent (floatList, expanded) =
    listOf floatComponent floatList

listOf : (x -> Html ListMsg) -> List x -> Html ListMsg
listOf itemProducer items =
    ul [ class "list-of" ]
        (List.map (\item -> li [] [ (itemProducer item) ]) items)

{-| Component for a `(String)`

Usage:
    stringTuple1Component ("foo")
-}
stringTuple1Component : (String) -> Html a
stringTuple1Component stringTuple1 =
    tuple1Of stringComponent stringTuple1

{-| Component for a `(String, String)`

Usage:
    stringTuple2Component ("foo", "bar")
-}
stringTuple2Component : (String, String) -> Html a
stringTuple2Component stringTuple2 =
    tuple2Of stringComponent stringTuple2

tuple1Of : (x -> Html a) -> (x) -> Html a
tuple1Of itemProducer (item) =
    ul [ class "tuple-of" ]
       [ li [] [ (itemProducer item) ] ]

tuple2Of : (x -> Html a) -> (x, x) -> Html a
tuple2Of itemProducer (item1, item2) =
    ul [ class "tuple-of" ]
        [ li [] [ (itemProducer item1) ]
        , li [] [ (itemProducer item2) ]
        ]
