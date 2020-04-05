module Messenger.Update exposing (update)

import Dict

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
                people = Dict.insert comment.people.id comment.people messenger.people
            }
