module World.Subscriptions exposing (subscriptions)

import Time

import Message as Main exposing (Message(..))
import World.Message exposing (Message(..))
import World.Model exposing (World)


subscriptions : World -> Sub Main.Message
subscriptions _ = 
    Time.every 1000 (\time -> MessageForWorld (Timer time))

    