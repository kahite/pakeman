module World.Zones.Data.BourgPoulette exposing (create)

import People.Data.P1_Mum as P1_Mum
import World.Zones.Model exposing (Zone, Biotope(..))


create: Zone
create = Zone
    "Bourg Poulette"
    City
    [
        "Route 1"
    ]
    [
        P1_Mum.create
    ]
    []