module Pakeman.Data.P22_Reposdepac exposing (create)

import Pakeman.Model as Pakeman exposing (Pakeman, Identity(..))
import Pakeman.Type as Type exposing (Type(..))


create: Pakeman.Pakeman
create = Pakeman.Pakeman 
    Reposdepac
    "Reposdepac"
    Type.Flying
    Type.Normal
