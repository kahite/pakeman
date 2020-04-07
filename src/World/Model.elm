module World.Model exposing (World, init, canEncounter)

import World.Encounter.Model as Encounter  
import World.Zones.Model as Zone

import World.Zones.Data.Z1_BourgPoulette as Z1_BourgPoulette
import World.Zones.Data.Z2_Road1 as Z2_Road1


type alias World = {
        currentZone: Zone.Zone,
        zones: List Zone.Zone,
        encounters: List Encounter.Encounter
    }


init: World
init = let currentZone = Z1_BourgPoulette.create
    in World 
        currentZone 
        [
            currentZone,
            Z2_Road1.create
        ]
        []


canEncounter: World -> Bool
canEncounter world 
    = List.length world.encounters < 8 
    && Zone.hasPakeman world.currentZone