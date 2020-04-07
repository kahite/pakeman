module Messenger.Model exposing (Messenger, init)

import Messenger.Comment.Model exposing (Comment)
import People.Model as People


type alias Messenger = {
        people: List People.People,
        comments: List Comment 
    }


init: Messenger
init = Messenger [] []
