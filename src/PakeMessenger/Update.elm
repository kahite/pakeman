module PakeMessenger.Update exposing (update, cmdAddComment, cmd)

import Dict
import Task

import Message as Main exposing (Message(..))
import PakeMessenger.Message exposing (Message(..))
import PakeMessenger.Model exposing (Messenger, Comment)


update: Main.Message -> Messenger -> Messenger
update msgFor messenger = 
    case msgFor of 
        MessageForMessenger msg -> updateMessenger msg messenger
        _ -> messenger

updateMessenger: Message -> Messenger -> Messenger
updateMessenger msg messenger = 
    case msg of 
        AddComment comment -> {messenger | 
                comments = List.append [comment] messenger.comments,
                people = Dict.insert comment.people.id comment.people messenger.people
            }

cmd: Main.Message -> Cmd Main.Message
cmd msgFor =  
    case msgFor of 
        MessageForMessenger msg -> cmdMessenger msg
        _ -> Cmd.none

cmdMessenger: Message -> Cmd Main.Message
cmdMessenger msg = 
    case msg of 
        AddComment comment -> cmdAddComment comment


cmdAddComment: Comment -> Cmd Main.Message
cmdAddComment comment =
    Task.perform (\_ -> MessageForMessenger (AddComment comment))  (Task.succeed 1)
