module Pakeman.Data.P13_Ospucat exposing (create)

import Pakeman.Model as Pakeman exposing (Pakeman)
import Pakeman.Type as Type exposing (Type(..))


create: Pakeman.Pakeman
create = Pakeman.Pakeman 
    "Ospucat"
    13
    Type.Bug
    Type.Poison
