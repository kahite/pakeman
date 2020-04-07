module Zones.Data.Z1_BourgPoulette exposing (create)

import People.Data.P1_Mum as P1_Mum
import People.Data.P2_ProfChichon as P2_ProfChichon
import Zones.Model exposing (Zone, Biotope(..), Identity(..))


create: Zone
create = Zone
    BourgPoulette
    "Bourg Poulette"
    City
    [
        Road1
    ]
    [
        P1_Mum.create,
        P2_ProfChichon.create
    ]
    []