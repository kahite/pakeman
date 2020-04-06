module Pakedex.Model exposing (Pakedex, init, getPakeman, hasSeenPakeman, hasCapturedPakeman)

import Pakeman.Model exposing (Pakeman, Identity(..)) 
import Pakeman.Data.P1_Bilbuzorre
import Pakeman.Data.P2_Herbuzorre
import Pakeman.Data.P3_Flaruzorre
import Pakeman.Data.P4_Solomiche
import Pakeman.Data.P5_Reptuncel
import Pakeman.Data.P6_Drocoifei
import Pakeman.Data.P7_Coropice
import Pakeman.Data.P8_Coroboffe
import Pakeman.Data.P9_Tartonk
import Pakeman.Data.P10_Chenupon
import Pakeman.Data.P11_Chrysoceur
import Pakeman.Data.P12_Populisuan
import Pakeman.Data.P13_Ospucat
import Pakeman.Data.P14_Cacanfart
import Pakeman.Data.P15_Dordoignon
import Pakeman.Data.P16_Raicaal
import Pakeman.Data.P17_Raicaips
import Pakeman.Data.P18_Raicornoge
import Pakeman.Data.P19_Rototo
import Pakeman.Data.P20_Rototoc
import Pakeman.Data.P21_Poufobac
import Pakeman.Data.P22_Reposdepac
import Pakeman.Data.P23_Oba
import Pakeman.Data.P24_Orbak
import Pakeman.Data.P25_Pukochi


type alias Pakedex = {
        list: List Pakeman,
        seen: List Identity,
        captured: List Identity
    }


getPakeman: Pakedex -> Identity -> Pakeman
getPakeman pakedex identity = 
    let isPakeman = List.head (List.filter (\ pakeman -> pakeman.identity == identity) pakedex.list)
    in
    case isPakeman of
        Just justPakeman -> justPakeman
        Nothing -> Pakeman.Model.init

hasSeenPakeman: Pakedex -> Identity -> Bool
hasSeenPakeman pakedex identity = List.member identity pakedex.seen


hasCapturedPakeman: Pakedex -> Identity -> Bool
hasCapturedPakeman pakedex identity = List.member identity pakedex.captured


init: Pakedex
init = Pakedex 
    [
        Pakeman.Data.P1_Bilbuzorre.create,
        Pakeman.Data.P2_Herbuzorre.create,
        Pakeman.Data.P3_Flaruzorre.create,
        Pakeman.Data.P4_Solomiche.create,
        Pakeman.Data.P5_Reptuncel.create,
        Pakeman.Data.P6_Drocoifei.create,
        Pakeman.Data.P7_Coropice.create,
        Pakeman.Data.P8_Coroboffe.create,
        Pakeman.Data.P9_Tartonk.create,
        Pakeman.Data.P10_Chenupon.create,
        Pakeman.Data.P11_Chrysoceur.create,
        Pakeman.Data.P12_Populisuan.create,
        Pakeman.Data.P13_Ospucat.create,
        Pakeman.Data.P14_Cacanfart.create,
        Pakeman.Data.P15_Dordoignon.create,
        Pakeman.Data.P16_Raicaal.create,
        Pakeman.Data.P17_Raicaips.create,
        Pakeman.Data.P18_Raicornoge.create,
        Pakeman.Data.P19_Rototo.create,
        Pakeman.Data.P20_Rototoc.create,
        Pakeman.Data.P21_Poufobac.create,
        Pakeman.Data.P22_Reposdepac.create,
        Pakeman.Data.P23_Oba.create,
        Pakeman.Data.P24_Orbak.create,
        Pakeman.Data.P25_Pukochi.create
    ]
    []
    []
    