module World.View exposing (view)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)

import Message as Main exposing (Message(..))
import Pakedex.Model as Pakedex exposing (Pakedex)
import Pakeman.View as Pakeman
import People.View as People
import Zones.Model as ZoneModel
import Zones.View as Zone
import World.Model exposing (World)
import World.Message exposing (Message(..))


view: World -> Pakedex -> Html Main.Message
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
    if ZoneModel.hasPakeman world.currentZone
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
    if ZoneModel.hasPakeman world.currentZone
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
            ) (ZoneModel.getPakemans world.currentZone)
        )
    ]
    else []

displayPeopleInZone: World -> List (Html Main.Message)
displayPeopleInZone world = 
    if ZoneModel.hasPeople world.currentZone
    then [            
        Html.h5 [class "tl"] [text "Talk to"],
        div [class "flex flex-wrap"] (
            List.map (\ people -> 
                div [class "w-25"] [People.display people (MessageForWorld (TalkTo people))] 
            ) (ZoneModel.getPeople world.currentZone)
        )
    ]
    else []

displayAvailableZones: World -> List (Html Main.Message)
displayAvailableZones world = 
    [            
        Html.h5 [class "tl"] [text "Travel to"],
        div [class "flex flex-wrap"] (
            List.map (\ zone -> 
                div [class "w-25"] [Zone.display zone (MessageForWorld (ChangeZone zone))] 
            ) (getAccessibleZones world)
        )
    ]


getAccessibleZones: World -> List ZoneModel.Zone
getAccessibleZones world = 
    List.filterMap
    (\ identity -> 
        List.head (List.filter (\ zone -> zone.id == identity) world.zones)
    )
    world.currentZone.accessibleZones


