module Pakeman.Data.P13_Ospucat exposing (create)

import Pakeman.Model as Pakeman exposing (Pakeman, Identity(..))
import Pakeman.Type as Type exposing (Type(..))


create: Pakeman.Pakeman
create = Pakeman.Pakeman 
    Ospucat
    "Ospucat"
    Type.Bug
    Type.Poison
