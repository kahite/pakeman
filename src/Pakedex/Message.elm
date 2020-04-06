module Pakedex.Message exposing (Message(..))

import Pakeman.Model exposing (Identity(..))

type Message 
    = AddSeenPakeman Identity
