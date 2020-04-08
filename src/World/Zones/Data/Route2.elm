module World.Zones.Data.Route2 exposing (create)

import World.Zones.Model exposing (Zone, Biotope(..))
 

create: Zone
create = Zone
    "Route 2"
    Plain
    [
        "Judielle",
        "Foret de Jude"
    ]
    []
    [
        (50, "Raicaal"), 
        (50, "Rototo"),
        (25, "Ospucat"), 
        (25, "Poufobac"), 
        (25, "Chenupan")
    ]