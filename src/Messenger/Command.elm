module Messenger.Command exposing (cmd, cmdAddComment, cmdAddNarratorMessage)

import Task

import Message as Main exposing (Message(..))
import Messenger.Message exposing (Message(..))
import Messenger.Model exposing (Messenger, Comment)
import People.Model exposing (People, narrator)


cmd: Main.Message -> Messenger -> Cmd Main.Message
cmd msgFor messenger =  
    case msgFor of 
        MessageForMessenger msg -> cmdMessenger msg messenger
        _ -> Cmd.none

cmdMessenger: Message -> Messenger -> Cmd Main.Message
cmdMessenger msg _ = 
    case msg of 
        _ -> Cmd.none


cmdAddComment: People -> String -> Cmd Main.Message
cmdAddComment people message =
    Task.perform (\_ -> MessageForMessenger (AddComment (Comment people message)))  (Task.succeed 1)


cmdAddNarratorMessage: String -> Cmd Main.Message 
cmdAddNarratorMessage message = 
    cmdAddComment narrator message
