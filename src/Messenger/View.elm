module Messenger.View exposing (view)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)

import Messenger.Model exposing (Messenger)
import Messenger.Comment.View as Comment


view: Messenger -> Html msg
view messenger = 
    div [] [
        Html.h3 [] [text "PakeMessenger"],
        div [class "tj"] (List.map Comment.view messenger.comments)
    ]

