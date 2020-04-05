module Messenger.Message exposing (Message(..))

import Messenger.Model exposing (Comment)


type Message 
    = AddComment Comment
