module Pakeman.Data.P12_Populisuan exposing (create)

import Pakeman.Model as Pakeman exposing (Pakeman, Identity(..))
import Type


create: Pakeman.Pakeman
create = Pakeman.Pakeman 
    Populisuan
    "Populisuan"
    Type.Bug
    Type.Flying
