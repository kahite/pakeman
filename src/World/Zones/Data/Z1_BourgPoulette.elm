module World.Zones.Data.Z1_BourgPoulette exposing (create)

import People.Data.P1_Mum as P1_Mum
import World.Zones.Model exposing (Zone, Biotope(..), Identity(..))


create: Zone
create = Zone
    BourgPoulette
    "Bourg Poulette"
    City
    [
        Road1
    ]
    [
        P1_Mum.create
    ]
    []