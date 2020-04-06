module Pakedex.Update exposing (update)


import Message as Main exposing (Message(..))
import Pakedex.Message exposing (Message(..))
import Pakedex.Model exposing (Pakedex)


update: Main.Message -> Pakedex -> Pakedex
update msgFor pakedex = 
    case msgFor of 
        MessageForPakedex msg -> updatePakedex msg pakedex
        _ -> pakedex

updatePakedex: Message -> Pakedex -> Pakedex
updatePakedex msg pakedex = 
    case msg of 
        AddSeenPakeman pakemanId ->
            { pakedex | seen = List.append [pakemanId] pakedex.seen }
