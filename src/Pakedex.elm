module Pakedex exposing (Pakedex, init, view)

import Html exposing (Html, div, text)
import Set exposing (Set)

import Pakeman
import Pakemans.P1_Bilbuzorre
import Pakemans.P2_Herbuzorre
import Pakemans.P3_Flaruzorre
import Pakemans.P4_Solomeche
import Pakemans.P5_Reptuncel
import Pakemans.P6_Drocoifei
import Pakemans.P7_Coropice
import Pakemans.P8_Coroboffe
import Pakemans.P9_Tartonk

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
        Pakemans.P1_Bilbuzorre.create,
        Pakemans.P2_Herbuzorre.create,
        Pakemans.P3_Flaruzorre.create,
        Pakemans.P4_Solomeche.create,
        Pakemans.P5_Reptuncel.create,
        Pakemans.P6_Drocoifei.create,
        Pakemans.P7_Coropice.create,
        Pakemans.P8_Coroboffe.create,
        Pakemans.P9_Tartonk.create
    ] 
    (Set.insert 4 (Set.insert 9 Set.empty))
    Set.empty
