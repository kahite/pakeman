module Pakedex exposing (Pakedex, init, view, getPakeman, hasSeenPakeman, hasCapturedPakeman)

import Dict
import Html exposing (Html, div, text)
import Set exposing (Set)

import Pakeman 
import Species.P1_Bilbuzorre
import Species.P2_Herbuzorre
import Species.P3_Flaruzorre
import Species.P4_Solomeche
import Species.P5_Reptuncel
import Species.P6_Drocoifei
import Species.P7_Coropice
import Species.P8_Coroboffe
import Species.P9_Tartonk

type alias Pakedex = {
        list: Dict.Dict Int Pakeman.Pakeman,
        seen: Set Int,
        captured: Set Int
    }


view: Pakedex -> Html msg
view pakedex = 
    div [] (List.map (\ (id, pakeman) -> 
        div [] [
            if hasSeenPakeman pakedex id
            then text pakeman.name
            else text "-----"
        ]
    ) (Dict.toList pakedex.list))


getPakeman: Pakedex -> Int -> Pakeman.Pakeman
getPakeman pakedex id = 
    case Dict.get id pakedex.list of
        Just p -> p
        Nothing -> Pakeman.init

hasSeenPakeman: Pakedex -> Int -> Bool
hasSeenPakeman pakedex id = Set.member id pakedex.seen

hasCapturedPakeman: Pakedex -> Int -> Bool
hasCapturedPakeman pakedex id = Set.member id pakedex.captured


init: Pakedex
init = Pakedex 
    (Dict.fromList [
        (1, Species.P1_Bilbuzorre.create),
        (2, Species.P2_Herbuzorre.create),
        (3, Species.P3_Flaruzorre.create),
        (4, Species.P4_Solomeche.create),
        (5, Species.P5_Reptuncel.create),
        (6, Species.P6_Drocoifei.create),
        (7, Species.P7_Coropice.create),
        (8, Species.P8_Coroboffe.create),
        (9, Species.P9_Tartonk.create)
    ])
    (Set.insert 4 (Set.insert 9 Set.empty))
    (Set.insert 9 Set.empty)