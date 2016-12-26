module ComponentsDemo exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)

import Components exposing (..)

examples : List (Html ComponentMsg)
examples =
    [ displayString "foo"
    , displayInt 42
    , displayColor (rgb 0.2 0.7 1.0)
    , displayColor (rgba 0.2 0.7 1.0 0.5)
    , displayColor (hex "#6550ff")
    , displayColor (hexa "#6550ff" 0.5)
    , displayStringList ([ "aaa", "bbb", "ccc" ], True)
    , displayStringList ([ "aaa", "bbb", "ccc", "ddd", "eee", "fff", "ggg" ], True)
    , displayStringTuple1 ( "aaa" )
    , displayStringTuple2 ( "aaa", "bbb" )
    , displayIntList ([ 0, 12, 43, 14, 35 ], True)
    , displayIntList ([ 0, 12, 43, 14, 35, 0, 12, 43, 14, 35 ], True)
    , displayFloatList ([ 10.1, 12.2, 15.3, 55.4, 60.5, 111 ], True)
    -- , displayPlot (List.map (List.range 0 10) (\x -> x + 2))
    --               (List.map (List.range 0 10) (\y -> y * 2))
    -- , displayType (VarType "a")
    -- , displayType (Lambda "a" "b")
    -- , displayType (typeFromString "a -> b")
    -- , displayHtml (ul [ li [] [] ])
    -- , displaySvg (circle [r 10])
    -- , displaySvg (path [d "M10 10 L 20 20"] [])
    ]

stylesheetLink : String -> Html a
stylesheetLink url =
    node
        "link"
        [ rel "stylesheet"
        , type_ "text/css"
        , href url
        ]
        []

main : Html ComponentMsg
main =
  div []
    [ (stylesheetLink "./styles.css")
    , div [ class "components" ]
          [ ul []
               (List.map (\example -> li [] [ example ]) examples)
          ]
    , div [ class "components dark" ]
          [ ul []
               (List.map (\example -> li [] [ example ]) examples)
          ]
    ]
