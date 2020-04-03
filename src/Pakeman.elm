module Pakeman exposing (main)

import Browser
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Random
import Task
import Time

type alias Model = {
        console: List String
    }

type Message 
    = AddConsole String
    | Timer Time.Posix
    | TryEncounter String Bool

main : Program () Model Message
main = Browser.element { init = init, view = view, update = update, subscriptions = subscriptions }

init : () -> (Model, Cmd Message)
init _ = (Model ["Welcome to Pakeman !"], Cmd.none)
 
update : Message -> Model -> (Model, Cmd Message)
update msg model = 
    case msg of 
        AddConsole entry ->
            ({ model | console = List.append [entry] model.console}, Cmd.none)
        Timer posix ->
            (model, tryEncounter ("New message " ++ String.fromInt (Time.posixToMillis posix)))
        TryEncounter entry hasEncounter ->
            (model, 
                if hasEncounter
                then cmdAddConsole entry
                else Cmd.none
            )

cmdAddConsole: String -> Cmd Message
cmdAddConsole entry =
    Task.perform (\_ -> AddConsole entry)  (Task.succeed 1)

tryEncounter: String -> Cmd Message
tryEncounter entry =
    Random.generate (TryEncounter entry) chanceEncounter

chanceEncounter: Random.Generator Bool
chanceEncounter = 
    Random.weighted (10, True) [(90, False)]


subscriptions : Model -> Sub Message
subscriptions _ = 
    Time.every 1000 Timer


view : Model -> Html Message
view model =
    div [class "flex"] [
        div [class "w-25"] [
            Html.h3 [] [text "Menu"]
        ],
        div [class "w-50"] [
            Html.h3 [] [text "Main"]
        ],
        div [class "w-25"] [
            Html.h3 [] [text "Console"],
            div [] (List.map (\ elem -> div [] [text elem]) model.console)
        ]
    ]
