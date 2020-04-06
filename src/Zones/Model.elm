module Zones.Model exposing (Zone, Biotope(..), isZoneAccessible, getPeople, hasPeople, hasPakeman, getPropabilities, getPakemans)

import Pakeman.Model exposing (Identity(..))
import People.Model exposing (People)


type alias Zone = {
        id: Int,
        name: String,
        biotope: Biotope,
        accessibleZones: List Int,
        people: List People,
        pakemanPresence: List (Float, Identity)
    }

type Biotope 
    = Nothing
    | City
    | Plain
    | Forest
    | Moutain
    | Cavern

getPropabilities: Zone -> List (Float, Identity)
getPropabilities zone = zone.pakemanPresence

getPakemans: Zone -> List Identity
getPakemans zone = List.map (\ (_, species) -> species) zone.pakemanPresence

hasPakeman: Zone -> Bool
hasPakeman zone = not (List.isEmpty zone.pakemanPresence)

getPeople: Zone -> List People.Model.People
getPeople zone = zone.people

hasPeople: Zone -> Bool
hasPeople zone = not (List.isEmpty zone.people)

isZoneAccessible: Zone -> Int -> Bool
isZoneAccessible zone id = List.member id zone.accessibleZones
