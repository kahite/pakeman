module World.Command exposing (cmd)

import Random 
import Task

import World.Encounter.Model as Encounter
import Message as Main exposing (Message(..))
import Pakedex.Command as Pakedex
import Messenger.Command as Messenger
import World.Message exposing (Message(..))
import World.Model exposing (World, canEncounter)


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
                Pakedex.cmdAddSeenPakeman encounter.pakemanId
        TalkTo people -> 
            Messenger.cmdAddComment people people.welcomeText
        _ -> Cmd.none
