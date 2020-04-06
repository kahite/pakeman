module World.Model exposing (World, init, canEncounter)

import Dict

import World.Encounter.Model as Encounter  
import Zones.Model as Zone

import Zones.Data.Z1_BourgPoulette as Z1_BourgPoulette
import Zones.Data.Z2_Road1 as Z2_Road1


type alias World = {
        currentZone: Zone.Zone,
        zones: Dict.Dict Int Zone.Zone,
        encounters: List Encounter.Encounter
    }


init: World
init = let currentZone = Z1_BourgPoulette.create
    in World 
        currentZone 
        (Dict.fromList [
            (1, currentZone),
            (2, Z2_Road1.create)
        ])
        []


canEncounter: World -> Bool
canEncounter world 
    = List.length world.encounters < 8 
    && Zone.hasPakeman world.currentZone