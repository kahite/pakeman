module Model exposing (Model, init)

import Message exposing (Message(..))
import Pakedex
import PakeMessenger.Update as MessengerCommands
import PakeMessenger.Model as Messenger
import People.Model as People
import World


type alias Model = {
        pakedex: Pakedex.Pakedex,
        world: World.World,
        messenger: Messenger.Messenger
    }


init : () -> (Model, Cmd Message)
init _ = (
        Model Pakedex.init World.init Messenger.init, 
        Cmd.batch [
            MessengerCommands.cmdAddComment (Messenger.Comment People.narrator "Welcome to Pakeman !")
        ]
    )