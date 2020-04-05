module World.Update exposing (update)

import Dict
import Time

import Message as Main exposing (Message(..))
import World.Message exposing (Message(..))
import World.Model exposing (World)


update: Main.Message -> World -> World
update msgFor world = 
    case msgFor of 
        MessageForWorld msg -> updateWorld msg world
        _ -> world

updateWorld: Message -> World -> World
updateWorld msg world = 
    case msg of 
        ChangeZone zoneId -> 
            { world |  
                currentZone = case Dict.get zoneId world.zones of
                    Just z -> z
                    Nothing -> world.currentZone,
                encounters = []
            }
        MakeEncounter encounter ->
            { world | encounters = List.append world.encounters [encounter] }
        EncounterFinish time ->
            { world | 
                encounters = List.filter (\ encounter -> 
                    Time.posixToMillis time < Time.posixToMillis encounter.time + encounter.duration * 1000
                ) world.encounters    
            }
        _ -> 
            world
