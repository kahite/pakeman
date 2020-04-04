module Zones.Road1 exposing (create)

import Zones.Model exposing (Zone, Identity(..))
 

create: Zone
create = Zone
    "Road 1"
    Road1
    [BourgPoulette]
    [
        (25, 1), 
        (25, 4), 
        (25, 7), 
        (10, 2), 
        (10, 8), 
        (5, 9)
    ]