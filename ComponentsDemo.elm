module ComponentsDemo exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)

import Components exposing (..)

examples : List (Html a)
examples =
    [ stringComponent "foo"
    , numComponent 42
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
