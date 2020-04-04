module Zones.Z2_Road1 exposing (create)

import Zones.Model exposing (Zone, Biotope(..))
 

create: Zone
create = Zone
    2
    "Road 1"
    Plain
    [1]
    []
    [
        (30, 1), 
        (30, 4), 
        (30, 7), 
        (5, 2), 
        (5, 8), 
        (1, 9)
    ]