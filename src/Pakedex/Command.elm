module Pakedex.Command exposing (cmd, cmdAddSeenPakeman)

import Task

import Message as Main exposing (Message(..))
import Pakedex.Message exposing (Message(..))
import Pakedex.Model exposing (Pakedex, getPakeman, hasSeenPakeman)
import Pakeman.Model exposing (Identity(..))
import Messenger.Command as Messenger


cmd: Main.Message -> Pakedex -> Cmd Main.Message
cmd msgFor pakedex =  
    case msgFor of 
        MessageForPakedex msg -> cmdMessenger msg pakedex
        _ -> Cmd.none

cmdMessenger: Message -> Pakedex -> Cmd Main.Message
cmdMessenger msg pakedex = 
    case msg of 
        AddSeenPakeman pakemanId ->
            let pakeman = getPakeman pakedex pakemanId
            in 
            if not (hasSeenPakeman pakedex pakemanId)
            then Messenger.cmdAddNarratorMessage ("Wow ! A " ++ pakeman.name ++ ", wild !")
            else Cmd.none


cmdAddSeenPakeman: Identity -> Cmd Main.Message
cmdAddSeenPakeman pakemanId =
    Task.perform (\_ -> MessageForPakedex (AddSeenPakeman pakemanId))  (Task.succeed 1)
