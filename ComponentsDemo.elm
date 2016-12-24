module ComponentsDemo exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)

import Components exposing (..)

examples : List (Html a)
examples =
    [ stringComponent "foo"
    , intComponent 42
    -- , rgbColorComponent 0.2 0.7 1.0
    -- , rgbaColorComponent 0.2 0.7 1.0 0.5
    , stringListComponent [ "aaa", "bbb", "ccc" ]
    , stringListComponent [ "aaa", "bbb", "ccc", "ddd", "eee", "fff", "ggg" ]
    , intListComponent [ 0, 12, 43, 14, 35 ]
    , intListComponent [ 0, 12, 43, 14, 35, 0, 12, 43, 14, 35 ]
    , floatListComponent [ 10.1, 12.2, 15.3, 55.4, 60.5, 111 ]
    -- , hexColorComponent "#6550int
    -- , hexaColorComponent "#6550ff" 0.5
    -- , plotComponent (\a -> a + 2)
    -- , plot2Component (\a b -> a + b)
    -- , plot3Component (\a b c -> a + b + c)
    -- , typeComponent (varType "a")
    -- , typeComponent (lambda "a" "b")
    -- , typeComponent (typeFromString "a -> b")
    -- , htmlComponent (ul [ li [] [] ])
    -- , svgComponent (circle [r 10])
    -- , svgComponent (path [d "M10 10 L 20 20"] [])
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
