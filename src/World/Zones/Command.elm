module World.Zones.Command exposing (cmdAddPeople)

import Task

import Message as Main
import People.Model exposing (People)
import World.Message exposing (Message(..))
import World.Zones.Message exposing (Message(..))


cmdAddPeople: People -> Cmd Main.Message
cmdAddPeople people = Task.perform (\_ -> Main.MessageForWorld (MessageForZone (AddPeople people))) (Task.succeed 1)