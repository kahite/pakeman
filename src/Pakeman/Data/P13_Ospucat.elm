module Pakeman.Data.P13_Ospucat exposing (create)

import Pakeman.Model as Pakeman exposing (Pakeman, Identity(..))
import Type


create: Pakeman.Pakeman
create = Pakeman.Pakeman 
    Ospucat
    "Ospucat"
    Type.Bug
    Type.Poison
