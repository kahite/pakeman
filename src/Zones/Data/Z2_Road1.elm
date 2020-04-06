module Zones.Data.Z2_Road1 exposing (create)

import Pakeman.Model exposing (Identity(..))
import Zones.Model exposing (Zone, Biotope(..))
 

create: Zone
create = Zone
    2
    "Road 1"
    Plain
    [1]
    []
    [
        (50, Raicaal), 
        (50, Rototo),
        (25, Chenupon),
        (25, Ospucat), 
        (25, Poufobac), 
        (5, Bilbuzorre), 
        (5, Solomiche), 
        (5, Coropice)
    ]