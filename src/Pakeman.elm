module Pakeman exposing (Pakeman, init, displayCard)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)

import SvgHelper
import Type


type alias Pakeman = {
        id: Int,
        name: String,
        firstType: Type.Type,
        secondType: Type.Type
    }


init: Pakeman
init = Pakeman 0 "MissingNo" Type.Nothing Type.Nothing

displayCard: Pakeman -> Bool -> Bool -> Html msg
displayCard pakeman visible captured = 
    let (color, name) = if visible then (Type.getBgColor pakeman.firstType, pakeman.name) else (Type.getBgColor Type.Nothing, "?")
    in
    div [class ("relative ba bw1 ma1 pa3 " ++ color)] [
        div [] [text name],
        div [class "absolute top-0 left-0"] [
            if captured
            then SvgHelper.capturedIcon "black"
            else text ""
        ]
    ]
