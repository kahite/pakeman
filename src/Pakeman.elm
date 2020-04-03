module Pakeman exposing (Pakeman)

import Type


type alias Pakeman = {
        id: Int,
        name: String,
        firstType: Type.Type,
        secondType: Type.Type
    }
