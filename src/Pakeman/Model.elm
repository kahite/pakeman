module Pakeman.Model exposing (Pakeman, Identity(..), init)

import Type


type alias Pakeman = {
        identity: Identity,
        name: String,
        firstType: Type.Type,
        secondType: Type.Type
    }


init: Pakeman
init = Pakeman MissingNo "MissingNo" Type.Nothing Type.Nothing


type Identity 
    = MissingNo
    | Bilbuzorre
    | Herbuzorre
    | Flaruzorre
    | Solomiche
    | Reptuncel
    | Drocoifei
    | Coropice
    | Coroboffe
    | Tartonk
    | Chenupon
    | Chrysoceur
    | Populisuan
    | Ospucat
    | Cacanfart
    | Dordoignon
    | Raicaal
    | Raicaips
    | Raicornoge
    | Rototo
    | Rototoc
    | Poufobac
    | Reposdepac
    | Oba
    | Orbak
    | Pukochi