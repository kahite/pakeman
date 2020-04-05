module Messenger.View exposing (view)

import Dict
import Html exposing (Html, div, span, text)
import Html.Attributes exposing (class)

import Messenger.Model exposing (Messenger)
import People.Model as People


view: Messenger -> Html msg
view messenger = 
    div [] [
        Html.h3 [] [text "PakeMessenger"],
        div [class "tj"] (List.map (\ comment -> 
            let people = getPeople messenger comment.people.id
            in
            div [] [
                span [class (People.getMessageColor people)] [text (People.getName people)],
                span [] [text (" " ++ comment.comment)]
            ]
        ) messenger.comments)
    ]

getPeople: Messenger -> Int -> People.People
getPeople messenger peopleId = 
    case Dict.get peopleId messenger.people of
        Just p -> p
        Nothing -> People.narrator

