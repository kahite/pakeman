module World exposing (World, canAddVisiblePakeman, init, view, addVisiblePakeman)

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
        div [class "flex flex-wrap"] (
            List.map (\ pakeman -> 
                div [class "w-25"] [
                    Pakeman.displayCard 
                        pakeman 
                        True 
                        (Pakedex.hasCapturedPakeman pakedex pakeman.id)
                ]
        ) world.visiblePakemans),
        Html.h5 [] [text "Pakeman species in zone"],
        div [class "flex flex-wrap"] (
            List.map (\ species -> 
                div [class "w-25"] [
                    Pakeman.displayCard 
                        (Pakedex.getPakeman pakedex species) 
                        (Pakedex.hasSeenPakeman pakedex species)
                        (Pakedex.hasCapturedPakeman pakedex species)
                ] 
            ) (Zone.getSpecies world.currentZone)
        )
    ]

addVisiblePakeman: Pakeman.Pakeman -> World -> World
addVisiblePakeman pakeman world = { world | 
        visiblePakemans = List.append world.visiblePakemans [pakeman] 
    }

canAddVisiblePakeman: World -> Bool
canAddVisiblePakeman world = List.length world.visiblePakemans < 8