module Zones.Z1_BourgPoulette exposing (create)

import Zones.Model exposing (Zone, Biotope(..))

import People.P1_Mum
import People.P2_ProfChichon

create: Zone
create = Zone
    1
    "Bourg Poulette"
    City
    [2]
    [
        People.P1_Mum.create,
        People.P2_ProfChichon.create
    ]
    []