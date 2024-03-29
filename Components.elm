module Components exposing
    ( displayString
    , displayInt
    , displayFloat
    , displayColor
    , displayHtml
    , displayStringList
    , displayIntList
    , displayFloatList
    , displayColorList
    , displayStringTuple1
    , displayStringTuple2
    , ComponentMsg
    , rgb
    , rgba
    , hex
    , hexa
    )

{-| This module provides the visual representation
for different types of values. It could be used in the Playground-like
Editors.

# List of the available components
@docs displayString
    , displayInt
    , displayFloat
    , displayColor
    , displayHtml
    , displayStringList
    , displayIntList
    , displayFloatList
    , displayColorList
    , displayStringTuple1
    , displayStringTuple2
    , ComponentMsg
    , rgb
    , rgba
    , hex
    , hexa
-}

import Html exposing (..)
import Html.Attributes exposing (..)

{-| This message is sent between components
-}
type ComponentMsg = ListMsg | Nothing

-- # Primitives

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

-- # Colors

type Color =
      RGB Int Int Int
    | RGBA Int Int Int Float
    | Hex String
    | HexWithAlpha String Float

{-| Create a color using RGB parts: (rgb 0.5 1.0 1.0)
-}
rgb : Float -> Float -> Float -> Color
rgb r g b = RGB (floor (r * 255))
                (floor (g * 255))
                (floor (b * 255))

{-| Create a color using RGBA parts: (rgba 0.5 1.0 1.0 0.5)
-}
rgba : Float -> Float -> Float -> Float -> Color
rgba r g b a = RGBA (floor (r * 255))
                    (floor (g * 255))
                    (floor (b * 255))
                    a

{-| Create a color using Hex String: (hex "#80ffff")
-}
hex : String -> Color
hex hexStr = Hex hexStr

{-| Create a color using Hex String with aplha: (hexa "#80ffff" 0.5)
-}
hexa : String -> Float -> Color
hexa hexStr a = HexWithAlpha hexStr 1.0

{-| Component for a `Color`

Usage:
    displayColor (rgb 0.5 1.0 1.0)
    displayColor (rgba 0.5 1.0 1.0 0.5)
    displayColor (hex "#80ffff")
    displayColor (hexa "#80ffff" 0.5)
-}
displayColor : Color -> Html ComponentMsg
displayColor color =
    let
        colorStr =
            case color of
                RGB r g b -> "rgb(" ++ (toString r)
                             ++ "," ++ (toString g)
                             ++ "," ++ (toString b)
                             ++ ")"
                RGBA r g b a -> "rgba(" ++ (toString r)
                                 ++ "," ++ (toString g)
                                 ++ "," ++ (toString b)
                                 ++ "," ++ (toString a)
                                 ++ ")"
                Hex hexStr -> hexStr
                HexWithAlpha hexStr a -> hexStr
    in
        span [ style [ ( "backgroundColor", colorStr ) ]
             , class "color" ]
             [ ]

-- # Html

{-| Component for a `Html a`

Usage:
    displayHtml (span [] [ text "Hello" ])
-}
displayHtml : Html ComponentMsg -> Html ComponentMsg
displayHtml html =
    div [ class "html" ] [ html ]

-- # Lists

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

{-| Component for a `List Color`

Usage:
    displayColorList [ rgb 0.25 0.5 0.75
                     , rgb 0.75 0.5 0.25
                     , rgba 0.25 0.5 0.75 0.5
                     , rgba 0.75 0.5 0.25 0.5
                     , hex "#ff8080"
                     , hexa "#ff8080" 0.5
                     ]
-}
displayColorList : ListModel Color -> Html ComponentMsg
displayColorList (colorList, expanded) =
    listOf displayColor colorList

{-| Component for a `List (Html a)`

Usage:
    displayHtmlList [ h1 [] [ text "H1" ]
                    , h2 [] [ text "H2" ]
                    , h3 [] [ text "H3" ]
                    ]
-}
-- displayHtmlList : ListModel (Html ComponentMsg) -> Html ComponentMsg
-- displayHtmlList (htmlList, expanded) =
--     listOf displayHtml htmlList

listOf : (x -> Html ComponentMsg) -> List x -> Html ComponentMsg
listOf itemProducer items =
    ul [ class "list-of" ]
        (List.map (\item -> li [] [ (itemProducer item) ]) items)

-- # Tuples

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
