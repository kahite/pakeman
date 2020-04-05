module Pakedex.View exposing (view)

import Dict
import Html exposing (Html, div, text)

import Pakedex.Model exposing (Pakedex, hasSeenPakeman)


view: Pakedex -> Html msg
view pakedex = 
    div [] [
        Html.h3 [] [text "Pakedex"],
        div [] (List.map (\ (id, pakeman) -> 
            div [] [
                if hasSeenPakeman pakedex id
                then text pakeman.name
                else text "-----"
            ]
        ) (Dict.toList pakedex.list))
    ]
