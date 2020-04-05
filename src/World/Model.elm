module World.Model exposing (World, init, canEncounter)

import Dict

import Encounter  
import Zones.Model as Zone

import Zones.Z1_BourgPoulette 
import Zones.Z2_Road1 


type alias World = {
        currentZone: Zone.Zone,
        zones: Dict.Dict Int Zone.Zone,
        encounters: List Encounter.Encounter
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


canEncounter: World -> Bool
canEncounter world 
    = List.length world.encounters < 8
    && Zone.hasPakeman world.currentZone