module Command exposing (cmd)

import Random

import Encounter
import Message exposing (Message(..))
import Model exposing (Model)
import Pakedex
import PakeMessenger.Model exposing (Comment)
import PakeMessenger.Update as Messenger
import People.Model as People
import World

cmd : Message -> Model -> Cmd Message
cmd msg model =
    case msg of 
        Timer time -> 
                if World.canEncounter model.world
                then Random.generate (TryEncounter time) Encounter.genTryEncounter
                else Cmd.none
        TryEncounter time possible  ->
                if possible
                then Random.generate MakeEncounter (Encounter.genEncounter time model.world.currentZone)
                else Cmd.none
        MakeEncounter encounter -> 
            let pakeman = Pakedex.getPakeman model.pakedex encounter.pakemanId
            in 
            if not (Pakedex.hasSeenPakeman model.pakedex encounter.pakemanId)
            then Messenger.cmdAddComment (Comment People.narrator ("Wow ! A " ++ pakeman.name ++ ", wild !"))
            else Cmd.none
        WorldMessage worldMessage ->
            case worldMessage of
                World.TalkTo people -> Messenger.cmdAddComment (Comment people people.welcomeText)
                _ -> Cmd.none
        _ -> Cmd.none

    -- Cmd.batch
    --     [ Messenger.cmd msg
    --     ]