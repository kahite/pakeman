module Messenger.Model exposing (Messenger, init)

import Dict

import Messenger.Comment.Model exposing (Comment)
import People.Model as People


type alias Messenger = {
        people: Dict.Dict Int People.People,
        comments: List Comment 
    }


init: Messenger
init = Messenger Dict.empty []
