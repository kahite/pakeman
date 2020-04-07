module World.Zones.Update exposing (update)

import World.Zones.Message exposing (Message(..))
import World.Zones.Model exposing (Zone)


update: Message -> Zone -> Zone
update msg zone = 
    case msg of 
        AddPeople people -> 
            { zone |
                people = if List.member people zone.people
                    then zone.people
                    else List.append zone.people [people]
            }