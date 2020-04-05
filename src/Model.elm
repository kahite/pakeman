module Model exposing (Model, init)

import Message exposing (Message(..))
import Pakedex.Model as Pakedex
import Messenger.Command as MessengerCommand
import Messenger.Model as Messenger
import World.Model as World


type alias Model = {
        pakedex: Pakedex.Pakedex,
        world: World.World,
        messenger: Messenger.Messenger
    }


init : () -> (Model, Cmd Message)
init _ = (
        Model 
            Pakedex.init 
            World.init 
            Messenger.init, 
        Cmd.batch [
            MessengerCommand.cmdAddNarratorMessage "Welcome to Pakeman !"
        ]
    )