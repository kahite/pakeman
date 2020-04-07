module World.Message exposing (Message(..))

import Time 

import People.Model exposing (People)
import World.Encounter.Model exposing (Encounter)
import World.Zones.Message as Zone
import World.Zones.Model exposing (Zone)


type Message 
    = Timer Time.Posix
    | TryEncounter Time.Posix Bool 
    | MakeEncounter Encounter
    | EncounterFinish Time.Posix
    | ChangeZone Zone
    | TalkTo People
    | MessageForZone Zone.Message