module World.Update exposing (update)

import Time

import Message as Main exposing (Message(..))
import World.Message exposing (Message(..))
import World.Model exposing (World)
import World.Zones.Update as Zone


update: Main.Message -> World -> World
update msgFor world = 
    case msgFor of 
        MessageForWorld msg -> updateWorld msg world
        _ -> world

updateWorld: Message -> World -> World
updateWorld msg world = 
    case msg of 
        ChangeZone zone -> 
            { world |  
                currentZone = if List.member zone world.zones
                    then zone 
                    else world.currentZone,
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
        MessageForZone msgFor ->
            { world |
                currentZone = Zone.update msgFor world.currentZone
            }
        _ -> 
            world
