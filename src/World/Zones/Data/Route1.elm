module World.Zones.Data.Route1 exposing (create)

import World.Zones.Model exposing (Zone, Biotope(..))
 

create: Zone
create = Zone
    "Route 1"
    Plain
    [
        "Bourg Poulette",
        "Judielle"
    ]
    []
    [
        (50, "Raicaal"), 
        (50, "Rototo"),
        (25, "Chenupon"),
        (25, "Poufobac")
    ]