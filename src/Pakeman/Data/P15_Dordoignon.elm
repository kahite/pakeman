module Pakeman.Data.P15_Dordoignon exposing (create)

import Pakeman.Model as Pakeman exposing (Pakeman, Identity(..))
import Pakeman.Type as Type exposing (Type(..))


create: Pakeman.Pakeman
create = Pakeman.Pakeman 
    Dordoignon
    "Dordoignon"
    Type.Bug
    Type.Poison
