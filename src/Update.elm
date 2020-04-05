module Update exposing (update)

import Random

import Encounter
import Message exposing (Message(..))
import Model exposing (Model)
import Pakedex
import PakeMessenger
import People.Model as People
import World

update : Message -> Model -> (Model, Cmd Message)
update msg model = 
    case msg of 
        Timer time -> 
            ({ model |
                world = World.freeEncounter model.world time
            }, 
                if World.canEncounter model.world
                then Random.generate (TryEncounter time) Encounter.genTryEncounter
                else Cmd.none
            )
        TryEncounter time possible  ->
            (model, 
                if possible
                then Random.generate MakeEncounter (Encounter.genEncounter time model.world.currentZone)
                else Cmd.none
            )
        MakeEncounter encounter -> 
            let pakeman = Pakedex.getPakeman model.pakedex encounter.pakemanId
            in 
            ({model | 
                world = World.addEncounter encounter model.world,
                pakedex = Pakedex.addSeenPakeman model.pakedex encounter.pakemanId
            }, 
            if not (Pakedex.hasSeenPakeman model.pakedex encounter.pakemanId)
            then Cmd.map (\ cmdMessage -> MessengerMessage cmdMessage) 
                (PakeMessenger.cmdAddComment (PakeMessenger.Comment People.narrator ("Wow ! A " ++ pakeman.name ++ ", wild !")))
            else Cmd.none)
        WorldMessage worldMessage ->
            case worldMessage of
                World.TalkTo people ->
                    (model, 
                        Cmd.map (\ cmdMessage -> MessengerMessage cmdMessage) 
                            (PakeMessenger.cmdAddComment (PakeMessenger.Comment people people.welcomeText))
                    )
                _ ->
                    ({model | world = World.update worldMessage model.world}, Cmd.none)
        MessengerMessage messengerMessage -> 
            ({model | messenger = PakeMessenger.update messengerMessage model.messenger}, Cmd.none)