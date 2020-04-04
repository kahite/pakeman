module Zones.Model exposing (Zone, Identity(..), hasPakeman, getPropabilities, init, getPakemans)


type alias Zone = {
        name: String,
        identity: Identity,
        accessibleZones: List Identity,
        pakemanPresence: List (Float, Int)
    }

type Identity 
    = Nothing
    | BourgPoulette
    | Road1


init: Zone
init = Zone "" Nothing [] []

getPakemans: Zone -> List Int
getPakemans zone = List.map (\ (_, species) -> species) zone.pakemanPresence

getPropabilities: Zone -> List (Float, Int)
getPropabilities zone = zone.pakemanPresence

hasPakeman: Zone -> Bool
hasPakeman zone = not (List.isEmpty zone.pakemanPresence)