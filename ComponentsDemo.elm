module ComponentsDemo exposing (main)

import Html exposing (..)

import Components exposing (..)

main =
  ul []
    [ li [] [ (stringComponent "foo") ]
    , li [] [ (numComponent 42) ]
    ]
