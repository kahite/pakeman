module Message exposing (Message(..))

import Time 

import Encounter
import PakeMessenger
import World


type Message 
    = Timer Time.Posix
    | TryEncounter Time.Posix Bool 
    | MakeEncounter Encounter.Encounter
    | WorldMessage World.Message
    | MessengerMessage PakeMessenger.Message