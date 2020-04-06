module Pakeman.Data.P21_Poufobac exposing (create)

import Pakeman.Model as Pakeman exposing (Pakeman, Identity(..))
import Pakeman.Type as Type exposing (Type(..))


create: Pakeman.Pakeman
create = Pakeman.Pakeman 
    Poufobac
    "Poufobac"
    Type.Flying
    Type.Normal
