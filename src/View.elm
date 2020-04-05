module View exposing (view)

import Html exposing (Html, div)
import Html.Attributes exposing (class)

import Message exposing (Message(..))
import Model exposing (Model)
import Pakedex.View as Pakedex
import Messenger.View as Messenger
import World.View as World


view : Model -> Html Message
view model =
    div [class "flex"] [
        div [class "w-20 pa3"] [
            Pakedex.view model.pakedex
        ],
        div [class "w-50 pa3"] [
            World.view model.world model.pakedex
        ],
        div [class "w-30 pa3"] [
            Messenger.view model.messenger
        ]
    ]