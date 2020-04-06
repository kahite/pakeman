module Pakeman.View exposing (displayCard)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)

import Pakeman.Model exposing (Pakeman)
import SvgHelper
import Type



displayCard: Pakeman -> Bool -> Bool -> Html msg
displayCard pakeman visible captured = 
    let (color, name) = if visible then (Type.getBgColor pakeman.firstType, pakeman.name) else (Type.getBgColor Type.Nothing, "?")
    in
    div [class ("relative ba bw1 ma1 pa3 " ++ color)] [
        div [] [text name],
        div [class "absolute top-0 left-0"] [
            if captured && visible
            then SvgHelper.capturedIcon "black"
            else text ""
        ]
    ]
