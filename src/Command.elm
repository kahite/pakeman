module Command exposing (cmd)

import Message exposing (Message(..))
import Model exposing (Model)
import Pakedex.Command as Pakedex
import PakeMessenger.Command as Messenger
import World.Command as World


cmd : Message -> Model -> Cmd Message
cmd msg model =
    Cmd.batch
        [ 
            Pakedex.cmd msg model.pakedex,
            Messenger.cmd msg model.messenger,
            World.cmd msg model.world
        ]