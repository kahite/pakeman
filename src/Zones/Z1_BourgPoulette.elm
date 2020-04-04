module Zones.Z1_BourgPoulette exposing (create)

import Zones.Model exposing (Zone, Biotope(..))

import People.ProfChon

create: Zone
create = Zone
    1
    "Bourg Poulette"
    City
    [2]
    [People.ProfChon.create]
    []