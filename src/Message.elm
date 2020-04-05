module Message exposing (Message(..))

import PakeMessenger.Message as Messenger
import Pakedex.Message as Pakedex
import World.Message as World


type Message 
    = MessageForWorld World.Message
    | MessageForMessenger Messenger.Message
    | MessageForPakedex Pakedex.Message