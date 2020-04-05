module Messenger.Comment.Model exposing (Comment)

import People.Model as People


type alias Comment = {
        people: People.People,
        comment: String
    }
