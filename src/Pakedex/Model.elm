module Pakedex.Model exposing (Pakedex, init, getPakeman, hasSeenPakeman, hasCapturedPakeman)

import Dict exposing (Dict)
import Set exposing (Set)

import Pakeman.Model exposing (Pakeman) 
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
import Pakeman.Data.P26_Rouchi
import Pakeman.Data.P27_Sobelette
import Pakeman.Data.P28_Soblouroi
import Pakeman.Data.P29_Nudarone
import Pakeman.Data.P30_Nudaruna
import Pakeman.Data.P31_Nudaqueen
import Pakeman.Data.P32_Nudaron
import Pakeman.Data.P33_Nudaruno
import Pakeman.Data.P34_Nudaking
import Pakeman.Data.P35_Melafee
import Pakeman.Data.P36_Meladelfe
import Pakeman.Data.P37_Gaipax
import Pakeman.Data.P38_Feinord
import Pakeman.Data.P39_Randaidai
import Pakeman.Data.P40_Gradaidai

import Pakeman.Data.P63_Obro
import Pakeman.Data.P64_Kodobro
import Pakeman.Data.P65_Olokozom

import Pakeman.Data.P95_Anux

import Pakeman.Data.P122_MMeme

import Pakeman.Data.P150_Mowtwo
import Pakeman.Data.P151_Mow


type alias Pakedex = {
        pakemans: Dict String Pakeman,
        seen: Set String,
        captured: Set String
    }


getPakeman: Pakedex -> String -> Pakeman
getPakeman pakedex name =
    case Dict.get name pakedex.pakemans of
        Just justPakeman -> justPakeman
        Nothing -> Pakeman.Model.init

hasSeenPakeman: Pakedex -> String -> Bool
hasSeenPakeman pakedex identity = Set.member identity pakedex.seen


hasCapturedPakeman: Pakedex -> String -> Bool
hasCapturedPakeman pakedex identity = Set.member identity pakedex.captured


init: Pakedex
init = Pakedex 
    (Dict.fromList [
        ("Bilbuzorre", Pakeman.Data.P1_Bilbuzorre.create),
        ("Herbuzorre", Pakeman.Data.P2_Herbuzorre.create),
        ("Flaruzorre", Pakeman.Data.P3_Flaruzorre.create),
        ("Solomiche", Pakeman.Data.P4_Solomiche.create),
        ("Reptuncel", Pakeman.Data.P5_Reptuncel.create),
        ("Drocofei", Pakeman.Data.P6_Drocoifei.create),
        ("Coropice", Pakeman.Data.P7_Coropice.create),
        ("Coroboffe", Pakeman.Data.P8_Coroboffe.create),
        ("Tartonk", Pakeman.Data.P9_Tartonk.create),
        ("Chenupon", Pakeman.Data.P10_Chenupon.create),
        ("Chrysoceur", Pakeman.Data.P11_Chrysoceur.create),
        ("Populisuan", Pakeman.Data.P12_Populisuan.create),
        ("Ospucat", Pakeman.Data.P13_Ospucat.create),
        ("Cacanfart", Pakeman.Data.P14_Cacanfart.create),
        ("Dordoignon", Pakeman.Data.P15_Dordoignon.create),
        ("Raicaal", Pakeman.Data.P16_Raicaal.create),
        ("Raicaps", Pakeman.Data.P17_Raicaips.create),
        ("Raicornoge", Pakeman.Data.P18_Raicornoge.create),
        ("Rototo", Pakeman.Data.P19_Rototo.create),
        ("Rototoc", Pakeman.Data.P20_Rototoc.create),
        ("Poufobac", Pakeman.Data.P21_Poufobac.create),
        ("Reposdepac", Pakeman.Data.P22_Reposdepac.create),
        ("Oba", Pakeman.Data.P23_Oba.create),
        ("Orbak", Pakeman.Data.P24_Orbak.create),
        ("Pukochi", Pakeman.Data.P25_Pukochi.create),
        ("Rouchi", Pakeman.Data.P26_Rouchi.create),
        ("Sobelette", Pakeman.Data.P27_Sobelette.create),
        ("Soblouroi", Pakeman.Data.P28_Soblouroi.create),
        ("Nudarone", Pakeman.Data.P29_Nudarone.create),
        ("Nudaruna", Pakeman.Data.P30_Nudaruna.create),
        ("Nudaqueen", Pakeman.Data.P31_Nudaqueen.create),
        ("Nudaron", Pakeman.Data.P32_Nudaron.create),
        ("Nudaruno", Pakeman.Data.P33_Nudaruno.create),
        ("Nudaking", Pakeman.Data.P34_Nudaking.create),
        ("Melafee", Pakeman.Data.P35_Melafee.create),
        ("Meladelfe", Pakeman.Data.P36_Meladelfe.create),
        ("Gaipax", Pakeman.Data.P37_Gaipax.create),
        ("Feinord", Pakeman.Data.P38_Feinord.create),
        ("Randaidai", Pakeman.Data.P39_Randaidai.create),
        ("Gradaidai", Pakeman.Data.P40_Gradaidai.create),

        ("Obro", Pakeman.Data.P63_Obro.create),
        ("Kodobro", Pakeman.Data.P64_Kodobro.create),
        ("Olokozom", Pakeman.Data.P65_Olokozom.create),
        ("Anux", Pakeman.Data.P95_Anux.create),
        ("M. Meme", Pakeman.Data.P122_MMeme.create),
        ("Mowtwo", Pakeman.Data.P150_Mowtwo.create),
        ("Mow", Pakeman.Data.P151_Mow.create)
    ]) 
    Set.empty
    Set.empty
    