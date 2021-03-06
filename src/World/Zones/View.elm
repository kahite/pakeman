module World.Zones.View exposing (display)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

import World.Zones.Model exposing (Zone, Biotope(..))


display: Zone -> msg -> Html msg
display zone msg = 
    div [
        class ("relative ba bw1 ma1 pa3 pointer " ++ getBgColor zone),
        onClick msg
    ] [
        div [onClick msg] [text zone.name]
    ]

getBgColor: Zone -> String
getBgColor zone =
    case zone.biotope of
        World.Zones.Model.Nothing -> ""
        City -> "bg-light-silver"
        Plain -> "bg-green"
        Forest -> "bg-dark-green"
        Cavern -> "bg-dark-gray"
