module PakeMessenger exposing (Messenger, Message(..), Comment, cmdAddComment, init, view, update)

import Dict
import Html exposing (Html, div, span, text)
import Html.Attributes exposing (class)
import Task

import People.Model as People

type alias Messenger = {
        people: Dict.Dict Int People.People,
        comments: List Comment 
    }

type alias Comment = {
        people: People.People,
        comment: String
    }

type Message 
    = AddComment Comment


init: Messenger
init = Messenger Dict.empty []


update: Message -> Messenger -> Messenger
update msg messenger = 
    case msg of 
        AddComment comment -> {messenger | 
                comments = List.append [comment] messenger.comments,
                people = Dict.insert comment.people.id comment.people messenger.people
            }


cmdAddComment: Comment -> Cmd Message
cmdAddComment comment =
    Task.perform (\_ -> AddComment comment)  (Task.succeed 1)


view: Messenger -> Html Message
view messenger = 
    div [] [
        Html.h3 [] [text "Pakedex messenger"],
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

