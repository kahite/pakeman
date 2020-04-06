module Pakeman.Data.P23_Oba exposing (create)

import Pakeman.Model as Pakeman exposing (Pakeman, Identity(..))
import Pakeman.Type as Type exposing (Type(..))


create: Pakeman.Pakeman
create = Pakeman.Pakeman 
    Oba
    "Oba"
    Type.Poison
    Type.Nothing
