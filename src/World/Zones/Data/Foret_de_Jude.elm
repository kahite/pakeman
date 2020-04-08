module World.Zones.Data.Foret_de_Jude exposing (create)

import World.Zones.Model exposing (Zone, Biotope(..))
 

create: Zone
create = Zone
    "Foret de Jude"
    Forest
    [
        "Route 2",
        "Argenteuil"
    ]
    []
    [
        (50, "Chenupon"), 
        (50, "Ospucat"),
        (25, "Chrysoceur"),
        (25, "Cacanfart"), 
        (5, "Bilbuzorre"), 
        (5, "Solomiche"), 
        (5, "Coropice"), 
        (1, "Pukochi")
    ]