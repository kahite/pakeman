module Subscriptions exposing (subscriptions)

import Time

import Message exposing (Message(..))
import Model exposing (Model)


subscriptions : Model -> Sub Message
subscriptions _ = 
    Time.every 1000 Timer