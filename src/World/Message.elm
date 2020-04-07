module World.Message exposing (Message(..))

import Time 

import World.Encounter.Model exposing (Encounter)
import People.Model exposing (People)
import Zones.Model exposing (Zone)


type Message 
    = Timer Time.Posix
    | TryEncounter Time.Posix Bool 
    | MakeEncounter Encounter
    | EncounterFinish Time.Posix
    | ChangeZone Zone
    | TalkTo People
