module World.Encounter.Model exposing (Encounter, genEncounter, genTryEncounter)

import Random 
import Time

import World.Zones.Model as Zone


type alias Encounter = {
        pakemanName: String,
        time: Time.Posix,
        duration: Int
    } 


genTryEncounter: Random.Generator Bool
genTryEncounter = Random.weighted (10, True) [(90, False)]


genEncounter: Time.Posix -> Zone.Zone -> Random.Generator Encounter
genEncounter time zone = 
    Random.map3 Encounter 
        (genPakemanName (Zone.getPropabilities zone)) 
        (Random.constant time)
        (genDuration (List.map (\ (p, _) -> (p, round p)) (Zone.getPropabilities zone)))

genPakemanName: List (Float, String) -> Random.Generator String
genPakemanName list = Random.weighted 
    (
        case List.head list of  
            Just r -> r
            Nothing -> (0, "MissingNo")
    ) (
        case List.tail list of
            Just l -> l
            Nothing -> []
    )

genDuration: List (Float, Int) -> Random.Generator Int
genDuration list = Random.weighted 
    (
        case List.head list of  
            Just r -> r
            Nothing -> (0, 0)
    ) (
        case List.tail list of
            Just l -> l
            Nothing -> []
    )