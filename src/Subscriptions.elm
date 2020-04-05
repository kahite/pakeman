module Subscriptions exposing (subscriptions)

import Message exposing (Message(..))
import Model exposing (Model)
import World.Subscriptions as World


subscriptions : Model -> Sub Message
subscriptions model = 
    Sub.batch [
        World.subscriptions model.world
    ]