module Encounter exposing (Encounter, genEncounter, genTryEncounter)

import Random 
import Time

import Zones.Model as Zone


type alias Encounter = {
        pakemanId: Int,
        time: Time.Posix,
        duration: Int
    } 


genTryEncounter: Random.Generator Bool
genTryEncounter = Random.weighted (10, True) [(90, False)]


genEncounter: Time.Posix -> Zone.Zone -> Random.Generator Encounter
genEncounter time zone = 
    Random.map3 Encounter 
        (genPakemanId (Zone.getPropabilities zone)) 
        (Random.constant time)
        (genDuration (List.map (\ (p, _) -> (p, round p)) (Zone.getPropabilities zone)))

genPakemanId: List (Float, Int) -> Random.Generator Int
genPakemanId list = Random.weighted 
    (
        case List.head list of  
            Just r -> r
            Nothing -> (0, 0)
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