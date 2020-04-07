module World.Zones.Data.Z2_Road1 exposing (create)

import Pakeman.Model exposing (Identity(..))
import World.Zones.Model exposing (Zone, Biotope(..), Identity(..))
 

create: Zone
create = Zone
    Road1
    "Road 1"
    Plain
    [
        BourgPoulette
    ]
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