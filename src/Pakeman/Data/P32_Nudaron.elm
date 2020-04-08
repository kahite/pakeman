module Pakeman.Data.P32_Nudaron exposing (create)

import Pakeman.Model as Pakeman exposing (Pakeman)
import Pakeman.Type as Type exposing (Type(..))


create: Pakeman.Pakeman
create = Pakeman.Pakeman 
    "Nudaron"
    32
    Type.Poison
    Type.Nothing
