module Zones.BourgPoulette exposing (create)

import Zones.Model exposing (Zone, Identity(..))

import People.ProfChon

create: Zone
create = Zone
    "Bourg Poulette"
    BourgPoulette
    [Road1]
    [People.ProfChon.create]
    []