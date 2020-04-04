module World exposing (World, freeEncounter, canEncounter, addEncounter, init, view)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Time

import Encounter 
import Pakeman
import Pakedex exposing (Pakedex)
import People.Model as People
import Zones.Model exposing (Zone, getPakemans, hasPakeman, getPeople, hasPeople)

import Zones.BourgPoulette 


type alias World = {
        currentZone: Zone,
        encounters: List Encounter.Encounter
    }


init: World
init = World Zones.BourgPoulette.create []


view: World -> Pakedex -> Html msg
view world pakedex = 
    div [] (List.concat [
        [Html.h4 [] [text world.currentZone.name]],
        displayPakemanInSight world pakedex,
        displayPakemanInZone world pakedex,
        displayPeopleInZone world
    ])

displayPakemanInSight: World -> Pakedex -> List (Html msg)
displayPakemanInSight world pakedex = 
    if hasPakeman world.currentZone
    then [
        Html.h5 [] [text "Pakeman in sight"],
        div [class "flex flex-wrap"] (
            List.map (\ encounter -> 
                div [class "w-25"] [
                    Pakeman.displayCard 
                        (Pakedex.getPakeman pakedex encounter.pakemanId)
                        True 
                        False
                ]
        ) world.encounters)
    ]
    else []

displayPakemanInZone: World -> Pakedex -> List (Html msg)
displayPakemanInZone world pakedex = 
    if hasPakeman world.currentZone
    then [            
        Html.h5 [] [text "Pakeman species in zone"],
        div [class "flex flex-wrap"] (
            List.map (\ pakemanId -> 
                div [class "w-25"] [
                    Pakeman.displayCard 
                        (Pakedex.getPakeman pakedex pakemanId) 
                        (Pakedex.hasSeenPakeman pakedex pakemanId)
                        (Pakedex.hasCapturedPakeman pakedex pakemanId)
                ] 
            ) (getPakemans world.currentZone)
        )
    ]
    else []

displayPeopleInZone: World -> List (Html msg)
displayPeopleInZone world = 
    if hasPeople world.currentZone
    then [            
        Html.h5 [] [text "People"],
        div [class "flex flex-wrap"] (
            List.map (\ people -> 
                div [class "w-25"] [People.display people] 
            ) (getPeople world.currentZone)
        )
    ]
    else []


addEncounter: Encounter.Encounter -> World -> World
addEncounter encounter world = { world | 
        encounters = List.append world.encounters [encounter] 
    }

canEncounter: World -> Bool
canEncounter world 
    = List.length world.encounters < 8
    && hasPakeman world.currentZone

freeEncounter: World -> Time.Posix -> World
freeEncounter world time = { world | 
        encounters = List.filter (\ encounter -> 
            Time.posixToMillis time < Time.posixToMillis encounter.time + encounter.duration * 1000
        ) world.encounters       
    }