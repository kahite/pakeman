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
        (50, 16), 
        (50, 19),
        (25, 10),
        (25, 13), 
        (25, 21), 
        (5, 1), 
        (5, 4), 
        (5, 7)
    ]