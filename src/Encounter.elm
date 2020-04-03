module Encounter exposing (Encounter, genEncounter, genTryEncounter, toString)

import Random 

import Rarity


type alias Encounter = {
        rarity: Rarity.Rarity,
        value: Int    
    } 

genEncounter: Random.Generator Encounter
genEncounter = 
    Random.map2 Encounter Rarity.genRarity genValue

genValue: Random.Generator Int
genValue = Random.int 0 Random.maxInt

genTryEncounter: Random.Generator Bool
genTryEncounter = Random.weighted (10, True) [(90, False)]

toString: Encounter -> String
toString encounter = Rarity.toString encounter.rarity ++ String.fromInt encounter.value