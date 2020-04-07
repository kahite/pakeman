module World.Zones.Model exposing (Zone, Biotope(..), Identity(..), getPeople, hasPeople, hasPakeman, getPropabilities, getPakemans)

import People.Model exposing (People)


type alias Zone = {
        id: Identity,
        name: String,
        biotope: Biotope,
        accessibleZones: List Identity,
        people: List People,
        pakemanPresence: List (Float, String)
    }

type Biotope 
    = Nothing
    | City
    | Plain
    | Forest
    | Moutain
    | Cavern

type Identity
    = NoZone
    | BourgPoulette
    | Road1


getPropabilities: Zone -> List (Float, String)
getPropabilities zone = zone.pakemanPresence

getPakemans: Zone -> List String
getPakemans zone = List.map (\ (_, species) -> species) zone.pakemanPresence

hasPakeman: Zone -> Bool
hasPakeman zone = not (List.isEmpty zone.pakemanPresence)

getPeople: Zone -> List People.Model.People
getPeople zone = zone.people

hasPeople: Zone -> Bool
hasPeople zone = not (List.isEmpty zone.people)
