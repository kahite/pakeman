module Pakeman.Data.P10_Chenupon exposing (create)

import Pakeman.Model as Pakeman exposing (Pakeman, Identity(..))
import Pakeman.Type as Type exposing (Type(..))


create: Pakeman.Pakeman
create = Pakeman.Pakeman 
    Chenupon
    "Chenupon"
    Type.Bug
    Type.Nothing
