module Messenger.Message exposing (Message(..))

import Messenger.Comment.Model exposing (Comment)


type Message 
    = AddComment Comment
