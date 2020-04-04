module Zones.Model exposing (Zone, Identity(..), getPeople, hasPeople, hasPakeman, getPropabilities, init, getPakemans)

import People.Model exposing (People)


type alias Zone = {
        name: String,
        identity: Identity,
        accessibleZones: List Identity,
        people: List People,
        pakemanPresence: List (Float, Int)
    }

type Identity 
    = Nothing
    | BourgPoulette
    | Road1


init: Zone
init = Zone "" Nothing [] [] []

getPropabilities: Zone -> List (Float, Int)
getPropabilities zone = zone.pakemanPresence

getPakemans: Zone -> List Int
getPakemans zone = List.map (\ (_, species) -> species) zone.pakemanPresence

hasPakeman: Zone -> Bool
hasPakeman zone = not (List.isEmpty zone.pakemanPresence)

getPeople: Zone -> List People.Model.People
getPeople zone = zone.people

hasPeople: Zone -> Bool
hasPeople zone = not (List.isEmpty zone.people)