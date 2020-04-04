module Encounter exposing (Encounter, genEncounter, genTryEncounter)

import Random 
import Time

import Zone


type alias Encounter = {
        pakemanId: Int,
        time: Time.Posix  
    } 


genTryEncounter: Random.Generator Bool
genTryEncounter = Random.weighted (10, True) [(90, False)]


genEncounter: Time.Posix -> Zone.Zone -> Random.Generator Encounter
genEncounter time zone = 
    Random.map2 Encounter 
        (genPakemanId (Zone.getPropabilities zone)) 
        (Random.constant time)

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
