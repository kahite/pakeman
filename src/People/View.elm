module People.View exposing (display)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

import People.Model exposing (People)


display: People -> msg -> Html msg
display people msg = 
    div [onClick msg, class ("relative ba bw1 ma1 pa3 pointer " ++ people.backgroundColor)] [
        div [] [text people.name]
    ]
