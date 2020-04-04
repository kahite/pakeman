module Zone exposing (Zone, Zones(..), init, getSpecies)

import Rarity


type alias Zone = {
        name: String,
        accessibleZones: Zones,
        rarityProbability: List (Int, Rarity.Rarity),
        speciesPresence: List (Int, Rarity.Rarity)
    }

type Zones = Zones (List Zone)


init: Zone
init = Zone "" (Zones []) [] []

getSpecies: Zone -> List Int
getSpecies zone = List.map (\ (species, _) -> species) zone.speciesPresence