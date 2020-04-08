module Pakeman.Data.P95_Anux exposing (create)

import Pakeman.Model as Pakeman exposing (Pakeman)
import Pakeman.Type as Type exposing (Type(..))


create: Pakeman.Pakeman
create = Pakeman.Pakeman 
    "Anux"
    95
    Type.Rock
    Type.Ground
