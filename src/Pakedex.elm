module Pakedex exposing (Pakedex, init, view)

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
        list: List Pakeman.Pakeman,
        viewed: Set Int,
        captured: Set Int
    }


view: Pakedex -> Html msg
view pakedex = 
    div [] (List.map (\ pakeman -> 
        div [] [
            if Set.member pakeman.id pakedex.viewed
            then text pakeman.name
            else text "-----"
        ]
    ) pakedex.list)


init: Pakedex
init = Pakedex 
    [
        Species.P1_Bilbuzorre.create,
        Species.P2_Herbuzorre.create,
        Species.P3_Flaruzorre.create,
        Species.P4_Solomeche.create,
        Species.P5_Reptuncel.create,
        Species.P6_Drocoifei.create,
        Species.P7_Coropice.create,
        Species.P8_Coroboffe.create,
        Species.P9_Tartonk.create
    ] 
    (Set.insert 4 (Set.insert 9 Set.empty))
    Set.empty
