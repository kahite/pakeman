module World.Message exposing (Message(..))

import Time 

import Encounter exposing (Encounter)
import People.Model exposing (People)


type Message 
    = Timer Time.Posix
    | TryEncounter Time.Posix Bool 
    | MakeEncounter Encounter
    | EncounterFinish Time.Posix
    | ChangeZone Int
    | TalkTo People
