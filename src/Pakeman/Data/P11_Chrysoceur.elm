module Pakeman.Data.P11_Chrysoceur exposing (create)

import Pakeman.Model as Pakeman exposing (Pakeman, Identity(..))
import Pakeman.Type as Type exposing (Type(..))


create: Pakeman.Pakeman
create = Pakeman.Pakeman 
    Chrysoceur
    "Chrysoceur"
    Type.Bug
    Type.Nothing
