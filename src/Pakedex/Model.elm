module Pakedex.Model exposing (Pakedex, init, getPakeman, hasSeenPakeman, hasCapturedPakeman)

import Dict
import Set exposing (Set)

import Pakeman 
import Species.P1_Bilbuzorre
import Species.P2_Herbuzorre
import Species.P3_Flaruzorre
import Species.P4_Solomiche
import Species.P5_Reptuncel
import Species.P6_Drocoifei
import Species.P7_Coropice
import Species.P8_Coroboffe
import Species.P9_Tartonk
import Species.P10_Chenupon
import Species.P11_Chrysoceur
import Species.P12_Populisuan
import Species.P13_Ospucat
import Species.P14_Cacanfart
import Species.P15_Dordoignon
import Species.P16_Raicaal
import Species.P17_Raicaips
import Species.P18_Raicornoge
import Species.P19_Rototo
import Species.P20_Rototoc
import Species.P21_Poufobac
import Species.P22_Reposdepac
import Species.P23_Oba
import Species.P24_Orbak
import Species.P25_Pukochi


type alias Pakedex = {
        list: Dict.Dict Int Pakeman.Pakeman,
        seen: Set Int,
        captured: Set Int
    }


getPakeman: Pakedex -> Int -> Pakeman.Pakeman
getPakeman pakedex id = 
    case Dict.get id pakedex.list of
        Just p -> p
        Nothing -> Pakeman.init

hasSeenPakeman: Pakedex -> Int -> Bool
hasSeenPakeman pakedex id = Set.member id pakedex.seen


hasCapturedPakeman: Pakedex -> Int -> Bool
hasCapturedPakeman pakedex id = Set.member id pakedex.captured


init: Pakedex
init = Pakedex 
    (Dict.fromList [
        (1, Species.P1_Bilbuzorre.create),
        (2, Species.P2_Herbuzorre.create),
        (3, Species.P3_Flaruzorre.create),
        (4, Species.P4_Solomiche.create),
        (5, Species.P5_Reptuncel.create),
        (6, Species.P6_Drocoifei.create),
        (7, Species.P7_Coropice.create),
        (8, Species.P8_Coroboffe.create),
        (9, Species.P9_Tartonk.create),
        (10, Species.P10_Chenupon.create),
        (11, Species.P11_Chrysoceur.create),
        (12, Species.P12_Populisuan.create),
        (13, Species.P13_Ospucat.create),
        (14, Species.P14_Cacanfart.create),
        (15, Species.P15_Dordoignon.create),
        (16, Species.P16_Raicaal.create),
        (17, Species.P17_Raicaips.create),
        (18, Species.P18_Raicornoge.create),
        (19, Species.P19_Rototo.create),
        (20, Species.P20_Rototoc.create),
        (21, Species.P21_Poufobac.create),
        (22, Species.P22_Reposdepac.create),
        (23, Species.P23_Oba.create),
        (24, Species.P24_Orbak.create),
        (25, Species.P25_Pukochi.create)
    ])
    Set.empty
    Set.empty