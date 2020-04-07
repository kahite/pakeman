module Pakeman.Model exposing (Pakeman, init)

import Pakeman.Type as Type exposing (Type(..))


type alias Pakeman = {
        name: String,
        number: Int,
        firstType: Type,
        secondType: Type
    }


init: Pakeman
init = Pakeman "MissingNo" 0 Type.Nothing Type.Nothing
