module ComponentsDemo exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)

import Components exposing (..)

examples : List (Html a)
examples =
    [ stringComponent "foo"
    , numComponent 42
    -- , rgbColorComponent 0.2 0.7 1.0
    -- , rgbaColorComponent 0.2 0.7 1.0 0.5
    -- , hexColorComponent "#6550ff"
    -- , hexaColorComponent "#6550ff" 0.5
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

main : Html a
main =
  div [ class "components" ]
    [ (stylesheetLink "./styles.css")
    , ul []
        (List.map (\example -> li [] [ example ]) examples)
    ]
