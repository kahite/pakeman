module Pakeman exposing (Pakeman, init, displayCard)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)

import Type


type alias Pakeman = {
        id: Int,
        name: String,
        firstType: Type.Type,
        secondType: Type.Type
    }


init: Pakeman
init = Pakeman 0 "MissingNo" Type.Nothing Type.Nothing

displayCard: Pakeman -> Html msg
displayCard pakeman = 
    div [class (Type.getBgColor pakeman.firstType)] [
        div [] [text pakeman.name]

    ]
