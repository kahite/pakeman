module World exposing (World, init, view)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)

import Pakeman
import Pakedex
import Zone

import Zones.Road1 


type alias World = {
        currentZone: Zone.Zone,
        visiblePakemans: List Pakeman.Pakeman
    }


init: World
init = World Zones.Road1.create []


view: World -> Pakedex.Pakedex -> Html msg
view world pakedex = 
    div [] [
        Html.h4 [] [text world.currentZone.name],
        Html.h5 [] [text "Pakeman in sight"],
        div [] (List.map (\ pakeman -> Pakeman.displayCard pakeman) world.visiblePakemans),
        Html.h5 [] [text "Pakeman species in zone"],
        div [class "flex"] (
            List.map (\ species -> 
                div [] [Pakeman.displayCard (Pakedex.getPakeman pakedex species)]
            ) (Zone.getSpecies world.currentZone)
        )
    ]
