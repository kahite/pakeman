module Pakeman exposing (Pakeman)

import Species
import Type


type alias Pakeman = {
        id: Int,
        species: Species.Species,
        name: String,
        firstType: Type.Type,
        secondType: Type.Type
    }

