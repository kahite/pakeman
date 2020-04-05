module Update exposing (update)

import Message exposing (Message(..))
import Model exposing (Model)
import Pakedex.Update as Pakedex
import PakeMessenger.Update as Messenger
import World.Update as World

update : Message -> Model -> Model
update msg model = 
    { model | 
        world = World.update msg model.world,
        messenger = Messenger.update msg model.messenger,
        pakedex = Pakedex.update msg model.pakedex
    }
