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
        (25, 1), 
        (25, 4), 
        (25, 7), 
        (10, 2), 
        (10, 8), 
        (5, 9)
    ]