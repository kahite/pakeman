module Update exposing (update)

import Message exposing (Message(..))
import Model exposing (Model)
import Pakedex
import PakeMessenger.Update as Messenger
import World

update : Message -> Model -> Model
update msg model = 
    case msg of 
        Timer time -> 
            { model |
                world = World.freeEncounter model.world time
            }
        MakeEncounter encounter -> 
            {model | 
                world = World.addEncounter encounter model.world,
                pakedex = Pakedex.addSeenPakeman model.pakedex encounter.pakemanId
            }
        WorldMessage worldMessage ->
            case worldMessage of
                World.TalkTo _ ->
                    model
                _ ->
                    {model | world = World.update worldMessage model.world}
        MessageForMessenger _ -> 
            {model | messenger = Messenger.update msg model.messenger}
        _ -> model
