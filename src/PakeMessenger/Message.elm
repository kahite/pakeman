module PakeMessenger.Message exposing (Message(..))

import PakeMessenger.Model exposing (Comment)


type Message 
    = AddComment Comment
