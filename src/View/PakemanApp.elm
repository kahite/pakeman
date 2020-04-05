module View.PakemanApp exposing (view)

import Html exposing (Html, div)
import Html.Attributes exposing (class)

import Pakedex
import PakeMessenger.View as Messenger
import World

import Message exposing (Message(..))
import Model exposing (Model)

view : Model -> Html Message
view model =
    div [class "flex"] [
        div [class "w-20 pa3"] [
            Pakedex.view model.pakedex
        ],
        div [class "w-50 pa3"] [
            Html.map (\ msg -> WorldMessage msg) (World.view model.world model.pakedex)
        ],
        div [class "w-30 pa3"] [
            Messenger.view model.messenger
        ]
    ]