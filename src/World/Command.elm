module World.Command exposing (cmd)

import Random 
import Task

import Message as Main exposing (Message(..))
import Messenger.Command as Messenger
import Pakedex.Command as Pakedex
import People.Data.P2_ProfChichon as ProfChichon
import People.Model exposing (Identity(..))
import World.Encounter.Model as Encounter
import World.Message exposing (Message(..))
import World.Model exposing (World, canEncounter)
import World.Zones.Command exposing (cmdAddPeople)


cmd : Main.Message -> World -> Cmd Main.Message
cmd msgFor world =
    case msgFor of 
        MessageForWorld msg ->
            cmdWorld msg world
        _ -> Cmd.none

cmdWorld : Message -> World -> Cmd Main.Message
cmdWorld msg world =
    case msg of 
        Timer time ->
            Cmd.batch [
                if canEncounter world
                then Random.generate (\ possible -> MessageForWorld (TryEncounter time possible)) Encounter.genTryEncounter
                else Cmd.none,
                Task.perform (\_ -> MessageForWorld (EncounterFinish time) ) (Task.succeed 1)
            ]
        TryEncounter time possible ->
            if possible
            then Random.generate (\ encounter -> MessageForWorld (MakeEncounter encounter)) (Encounter.genEncounter time world.currentZone)
            else Cmd.none
        MakeEncounter encounter ->
                Pakedex.cmdAddSeenPakeman encounter.pakemanName
        TalkTo people -> 
            Cmd.batch [
                Messenger.cmdAddComment people people.welcomeText,
                if people.identity == Mum
                then cmdAddPeople ProfChichon.create
                else Cmd.none
            ]
        _ -> Cmd.none
