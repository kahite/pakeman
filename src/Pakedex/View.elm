module Pakedex.View exposing (view)

import Html exposing (Html, div, text)

import Pakedex.Model exposing (Pakedex, hasSeenPakeman)


view: Pakedex -> Html msg
view pakedex = 
    div [] [
        Html.h3 [] [text "Pakedex"],
        div [] (List.map (\ pakeman -> 
            div [] [
                if hasSeenPakeman pakedex pakeman.identity
                then text pakeman.name
                else text "-----"
            ]
        ) pakedex.list)
    ]
