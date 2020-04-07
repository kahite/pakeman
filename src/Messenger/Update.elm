module Messenger.Update exposing (update)

import Message as Main exposing (Message(..))
import Messenger.Message exposing (Message(..))
import Messenger.Model exposing (Messenger)


update: Main.Message -> Messenger -> Messenger
update msgFor messenger = 
    case msgFor of 
        MessageForMessenger msg -> updateMessenger msg messenger
        _ -> messenger

updateMessenger: Message -> Messenger -> Messenger
updateMessenger msg messenger = 
    case msg of 
        AddComment comment -> 
            { messenger | 
                comments = List.append [comment] messenger.comments,
                people = 
                    if List.member comment.people messenger.people
                    then messenger.people
                    else List.append [comment.people] messenger.people
            }
