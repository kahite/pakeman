module Zones.Road1 exposing (create)

import Rarity
import Zone
 

create: Zone.Zone
create = Zone.Zone
    "Road 1"
    (Zone.Zones [])
    [
        (50, Rarity.VeryCommon), 
        (35, Rarity.Common), 
        (15, Rarity.Rare)
    ]
    [
        (1, Rarity.VeryCommon), 
        (4, Rarity.VeryCommon), 
        (7, Rarity.VeryCommon), 
        (2, Rarity.Common), 
        (8, Rarity.Common), 
        (9, Rarity.Rare)
    ]