module Zone exposing (Zone, Zones(..), getPropabilities, init, getSpecies)


type alias Zone = {
        name: String,
        accessibleZones: Zones,
        speciesPresence: List (Float, Int)
    }

type Zones = Zones (List Zone)


init: Zone
init = Zone "" (Zones []) []

getSpecies: Zone -> List Int
getSpecies zone = List.map (\ (_, species) -> species) zone.speciesPresence

getPropabilities: Zone -> List (Float, Int)
getPropabilities zone = zone.speciesPresence