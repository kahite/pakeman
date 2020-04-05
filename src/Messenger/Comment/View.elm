module Messenger.Comment.View exposing (view)

import Html exposing (Html, div, span, text)
import Html.Attributes exposing (class)

import Messenger.Comment.Model exposing (Comment)
import People.Model as People


view: Comment -> Html msg
view comment = 
    div [] [
        span [class (People.getMessageColor comment.people)] [text (People.getName comment.people)],
        span [] [text (" " ++ comment.comment)]
    ]

