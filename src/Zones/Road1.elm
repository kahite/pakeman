module Zones.Road1 exposing (create)

import Zone
 

create: Zone.Zone
create = Zone.Zone
    "Road 1"
    (Zone.Zones [])
    [
        (25, 1), 
        (25, 4), 
        (25, 7), 
        (10, 2), 
        (10, 8), 
        (5, 9)
    ]