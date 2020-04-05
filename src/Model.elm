module Model exposing (Model, init)

import Message exposing (Message(..))
import Pakedex
import PakeMessenger
import People.Model as People
import World


type alias Model = {
        pakedex: Pakedex.Pakedex,
        world: World.World,
        messenger: PakeMessenger.Messenger
    }


init : () -> (Model, Cmd Message)
init _ = (
        Model Pakedex.init World.init PakeMessenger.init, 
        Cmd.map (\ cmdMessage -> MessengerMessage cmdMessage) 
            (PakeMessenger.cmdAddComment (PakeMessenger.Comment People.narrator "Welcome to Pakeman !"))
    )