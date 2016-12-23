module ComponentsDemo exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)

import Components exposing (..)

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
  div []
    [ (stylesheetLink "./styles.css")
    , ul []
        [ li [] [ (stringComponent "foo") ]
        , li [] [ (numComponent 42) ]
        ]
    ]
