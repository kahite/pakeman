module Message exposing (Message(..))

import Time 

import Encounter
import PakeMessenger.Message as Messenger
import World


type Message 
    = Timer Time.Posix
    | TryEncounter Time.Posix Bool 
    | MakeEncounter Encounter.Encounter
    | WorldMessage World.Message
    | MessageForMessenger Messenger.Message