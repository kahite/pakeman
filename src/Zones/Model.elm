module Zones.Model exposing (Zone, Biotope(..), display, isZoneAccessible, getPeople, hasPeople, hasPakeman, getPropabilities, getPakemans)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

import People.Model exposing (People)


type alias Zone = {
        id: Int,
        name: String,
        biotope: Biotope,
        accessibleZones: List Int,
        people: List People,
        pakemanPresence: List (Float, Int)
    }

type Biotope 
    = Nothing
    | City
    | Plain
    | Forest
    | Moutain
    | Cavern

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

isZoneAccessible: Zone -> Int -> Bool
isZoneAccessible zone id = List.member id zone.accessibleZones

display: Zone -> msg -> Html msg
display zone msg = 
    div [
        class ("relative ba bw1 ma1 pa3 pointer " ++ getBgColor zone),
        onClick msg
    ] [
        div [onClick msg] [text zone.name]
    ]

getBgColor: Zone -> String
getBgColor zone =
    case zone.biotope of
        Nothing -> ""
        City -> "bg-light-silver"
        Plain -> "bg-green"
        Forest -> "bg-dark-green"
        Moutain -> "bg-light-blue"
        Cavern -> "bg-dark-gray"
