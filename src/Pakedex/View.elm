module Pakedex.View exposing (view)

import Dict
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Set

import Pakedex.Model exposing (Pakedex, hasSeenPakeman)


view: Pakedex -> Html msg
view pakedex = 
    div [class "h-75"] [
        Html.h3 [] [text "Pakedex"],
        div [] [
            text ("Seen: "
                ++ String.fromInt (Set.size pakedex.seen) 
                ++ " / " 
                ++ String.fromInt (Dict.size pakedex.pakemans)
            )
        ],
        div [class "overflow-y-scroll h-100"] (List.map (\ pakeman -> 
            div [] [
                if hasSeenPakeman pakedex pakeman.name
                then text pakeman.name
                else text "-----"
            ]
        ) (List.sortBy .number (Dict.values pakedex.pakemans)))
    ]
