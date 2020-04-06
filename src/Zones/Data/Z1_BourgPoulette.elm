module Zones.Data.Z1_BourgPoulette exposing (create)

import Zones.Model exposing (Zone, Biotope(..))

import People.Data.P1_Mum as P1_Mum
import People.Data.P2_ProfChichon as P2_ProfChichon

create: Zone
create = Zone
    1
    "Bourg Poulette"
    City
    [2]
    [
        P1_Mum.create,
        P2_ProfChichon.create
    ]
    []