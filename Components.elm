module Components exposing
    ( displayString
    , displayInt
    , displayFloat
    , displayStringList
    , displayIntList
    , displayFloatList
    , displayStringTuple1
    , displayStringTuple2
    )

{-| This module provides the visual representation
for different types of values. It could be used in the Playground-like
Editors.

# List of the available components
@docs displayString
    , displayInt
    , displayFloat
    , displayStringList
    , displayIntList
    , displayFloatList
    , displayStringTuple1
    , displayStringTuple2
-}

import Html exposing (..)
import Html.Attributes exposing (..)

{-| Component for a `String`

Usage:
    displayString "foobar"
-}
displayString : String -> Html a
displayString str =
    span [ class "string" ] [ text str ]

{-| Component for an `Int`

Usage:
    displayInt 42
-}
displayInt : Int -> Html a
displayInt num =
    span [ class "number int" ] [ text (toString num) ]

{-| Component for a `Float`

Usage:
    displayFloat 42.2
-}
displayFloat : Float -> Html a
displayFloat num =
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
    displayStringList [ "foo", "bar" ]
-}
displayStringList : ListModel String -> Html ListMsg
displayStringList (stringList, expanded) =
    listOf displayString stringList

{-| Component for a `List Int`

Usage:
    displayIntList [ 10, 12, 15, 55, 60 ]
-}
displayIntList : ListModel Int -> Html ListMsg
displayIntList (intList, expaned) =
    listOf displayInt intList

{-| Component for a `List Float`

Usage:
    displayFloatList [ 10.1, 12.2, 15.3, 55.4, 60.5, 111 ]
-}
displayFloatList : ListModel Float -> Html ListMsg
displayFloatList (floatList, expanded) =
    listOf displayFloat floatList

listOf : (x -> Html ListMsg) -> List x -> Html ListMsg
listOf itemProducer items =
    ul [ class "list-of" ]
        (List.map (\item -> li [] [ (itemProducer item) ]) items)

{-| Component for a `(String)`

Usage:
    displayStringTuple1 ("foo")
-}
displayStringTuple1 : (String) -> Html a
displayStringTuple1 stringTuple1 =
    tuple1Of displayString stringTuple1

{-| Component for a `(String, String)`

Usage:
    displayStringTuple1 ("foo", "bar")
-}
displayStringTuple2 : (String, String) -> Html a
displayStringTuple2 stringTuple2 =
    tuple2Of displayString stringTuple2

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
