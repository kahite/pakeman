module World exposing (World, freeEncounter, canEncounter, addEncounter, init, view)

import Dict
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Time

import Encounter 
import Pakeman
import Pakedex exposing (Pakedex)
import People.Model as People
import Zones.Model as Zone

import Zones.Z1_BourgPoulette 
import Zones.Z2_Road1 


type alias World = {
        currentZone: Zone.Zone,
        zones: Dict.Dict Int Zone.Zone,
        encounters: List Encounter.Encounter
    }


view: World -> Pakedex -> Html msg
view world pakedex = 
    div [] (List.concat [
        [Html.h4 [] [text world.currentZone.name]],
        displayPakemanInSight world pakedex,
        displayPakemanInZone world pakedex,
        displayPeopleInZone world,
        displayAvailableZones world
    ])

displayPakemanInSight: World -> Pakedex -> List (Html msg)
displayPakemanInSight world pakedex = 
    if Zone.hasPakeman world.currentZone
    then [
        Html.h5 [class "tl"] [text "Pakeman in sight"],
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
    if Zone.hasPakeman world.currentZone
    then [            
        Html.h5 [class "tl"] [text "Pakeman species in zone"],
        div [class "flex flex-wrap"] (
            List.map (\ pakemanId -> 
                div [class "w-25"] [
                    Pakeman.displayCard 
                        (Pakedex.getPakeman pakedex pakemanId) 
                        (Pakedex.hasSeenPakeman pakedex pakemanId)
                        (Pakedex.hasCapturedPakeman pakedex pakemanId)
                ] 
            ) (Zone.getPakemans world.currentZone)
        )
    ]
    else []

displayPeopleInZone: World -> List (Html msg)
displayPeopleInZone world = 
    if Zone.hasPeople world.currentZone
    then [            
        Html.h5 [class "tl"] [text "People"],
        div [class "flex flex-wrap"] (
            List.map (\ people -> 
                div [class "w-25"] [People.display people] 
            ) (Zone.getPeople world.currentZone)
        )
    ]
    else []

displayAvailableZones: World -> List (Html msg)
displayAvailableZones world = 
    [            
        Html.h5 [class "tl"] [text "Zones you can go to"],
        div [class "flex flex-wrap"] (
            List.map (\ zone -> 
                div [class "w-25"] [Zone.display zone] 
            ) (
                let filterAccessible = \ id _ -> Zone.isZoneAccessible world.currentZone id
                in
                    List.map (\ (_, z) -> z)
                    (Dict.toList (Dict.filter filterAccessible world.zones))
            )
        )
    ]

addEncounter: Encounter.Encounter -> World -> World
addEncounter encounter world = { world | 
        encounters = List.append world.encounters [encounter] 
    }

canEncounter: World -> Bool
canEncounter world 
    = List.length world.encounters < 8
    && Zone.hasPakeman world.currentZone

freeEncounter: World -> Time.Posix -> World
freeEncounter world time = { world | 
        encounters = List.filter (\ encounter -> 
            Time.posixToMillis time < Time.posixToMillis encounter.time + encounter.duration * 1000
        ) world.encounters       
    }



init: World
init = let currentZone = Zones.Z1_BourgPoulette.create
    in World 
        currentZone 
        (Dict.fromList [
            (1, currentZone),
            (2, Zones.Z2_Road1.create)
        ])
        []
