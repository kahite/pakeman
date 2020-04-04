module World exposing (World, freeEncounter, canEncounter, addEncounter, init, view)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Time

import Encounter
import Pakeman
import Pakedex
import Zone

import Zones.Road1 


type alias World = {
        currentZone: Zone.Zone,
        encounters: List Encounter.Encounter
    }


init: World
init = World Zones.Road1.create []


view: World -> Pakedex.Pakedex -> Html msg
view world pakedex = 
    div [] [
        Html.h4 [] [text world.currentZone.name],
        Html.h5 [] [text "Pakeman in sight"],
        div [class "flex flex-wrap"] (
            List.map (\ encounter -> 
                div [class "w-25"] [
                    Pakeman.displayCard 
                        (Pakedex.getPakeman pakedex encounter.pakemanId)
                        True 
                        False
                ]
        ) world.encounters),
        Html.h5 [] [text "Pakeman species in zone"],
        div [class "flex flex-wrap"] (
            List.map (\ pakemanId -> 
                div [class "w-25"] [
                    Pakeman.displayCard 
                        (Pakedex.getPakeman pakedex pakemanId) 
                        (Pakedex.hasSeenPakeman pakedex pakemanId)
                        (Pakedex.hasCapturedPakeman pakedex pakemanId)
                ] 
            ) (Zone.getSpecies world.currentZone)
        )
    ]


addEncounter: Encounter.Encounter -> World -> World
addEncounter encounter world = { world | 
        encounters = List.append world.encounters [encounter] 
    }

canEncounter: World -> Bool
canEncounter world = List.length world.encounters < 8

freeEncounter: World -> Time.Posix -> World
freeEncounter world time = { world | 
        encounters = List.filter (\ encounter -> 
            Time.posixToMillis time < Time.posixToMillis encounter.time + encounter.duration * 1000
        ) world.encounters       
    }