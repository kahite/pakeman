module PakeMessenger.Model exposing (Messenger, Comment, init)

import Dict

import People.Model as People


type alias Messenger = {
        people: Dict.Dict Int People.People,
        comments: List Comment 
    }

type alias Comment = {
        people: People.People,
        comment: String
    }

init: Messenger
init = Messenger Dict.empty []
