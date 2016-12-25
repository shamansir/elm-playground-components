module Components exposing
    ( displayString
    , displayInt
    , displayFloat
    , displayStringList
    , displayIntList
    , displayFloatList
    , displayStringTuple1
    , displayStringTuple2
    , ComponentMsg
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
    , ComponentMsg
-}

import Html exposing (..)
import Html.Attributes exposing (..)

{-| This message is sent between components
-}
type ComponentMsg = ListMsg | Nothing

{-| Component for a `String`

Usage:
    displayString "foobar"
-}
displayString : String -> Html ComponentMsg
displayString str =
    span [ class "string" ] [ text str ]

{-| Component for an `Int`

Usage:
    displayInt 42
-}
displayInt : Int -> Html ComponentMsg
displayInt num =
    span [ class "number int" ] [ text (toString num) ]

{-| Component for a `Float`

Usage:
    displayFloat 42.2
-}
displayFloat : Float -> Html ComponentMsg
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
displayStringList : ListModel String -> Html ComponentMsg
displayStringList (stringList, expanded) =
    listOf displayString stringList

{-| Component for a `List Int`

Usage:
    displayIntList [ 10, 12, 15, 55, 60 ]
-}
displayIntList : ListModel Int -> Html ComponentMsg
displayIntList (intList, expaned) =
    listOf displayInt intList

{-| Component for a `List Float`

Usage:
    displayFloatList [ 10.1, 12.2, 15.3, 55.4, 60.5, 111 ]
-}
displayFloatList : ListModel Float -> Html ComponentMsg
displayFloatList (floatList, expanded) =
    listOf displayFloat floatList

listOf : (x -> Html ComponentMsg) -> List x -> Html ComponentMsg
listOf itemProducer items =
    ul [ class "list-of" ]
        (List.map (\item -> li [] [ (itemProducer item) ]) items)

{-| Component for a `(String)`

Usage:
    displayStringTuple1 ("foo")
-}
displayStringTuple1 : (String) -> Html ComponentMsg
displayStringTuple1 stringTuple1 =
    tuple1Of displayString stringTuple1

{-| Component for a `(String, String)`

Usage:
    displayStringTuple1 ("foo", "bar")
-}
displayStringTuple2 : (String, String) -> Html ComponentMsg
displayStringTuple2 stringTuple2 =
    tuple2Of displayString stringTuple2

tuple1Of : (x -> Html ComponentMsg) -> (x) -> Html ComponentMsg
tuple1Of itemProducer (item) =
    ul [ class "tuple-of" ]
       [ li [] [ (itemProducer item) ] ]

tuple2Of : (x -> Html ComponentMsg) -> (x, x) -> Html ComponentMsg
tuple2Of itemProducer (item1, item2) =
    ul [ class "tuple-of" ]
        [ li [] [ (itemProducer item1) ]
        , li [] [ (itemProducer item2) ]
        ]
