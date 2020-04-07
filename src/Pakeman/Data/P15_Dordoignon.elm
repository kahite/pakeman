module Pakeman.Data.P15_Dordoignon exposing (create)

import Pakeman.Model as Pakeman exposing (Pakeman)
import Pakeman.Type as Type exposing (Type(..))


create: Pakeman.Pakeman
create = Pakeman.Pakeman 
    "Dordoignon"
    15
    Type.Bug
    Type.Poison
