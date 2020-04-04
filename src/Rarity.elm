module Rarity exposing (Rarity(..), genRarity, toString)

import Random


type Rarity 
    = VeryCommon
    | Common
    | Rare
    | VeryRare
    | Legendary

toString: Rarity -> String
toString rarity = case rarity of
    VeryCommon -> "Very common"
    Common -> "Common"
    Rare -> "Rare"
    VeryRare -> "Very rare"
    Legendary -> "Legendary"


genRarity: Random.Generator Rarity
genRarity = Random.weighted (50, VeryCommon) [(30, Common), (15, Rare), (5, VeryRare)]