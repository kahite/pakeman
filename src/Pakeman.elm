module Pakeman exposing (main)

import Browser
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)

type alias Model = {
        console: List String
    }

type Message = Nothing

main : Program () Model Message
main = Browser.element { init = init, view = view, update = update, subscriptions = subscriptions }

init : () -> (Model, Cmd Message)
init _ = (Model ["test1", "test2"], Cmd.none)
 
update : Message -> Model -> (Model, Cmd Message)
update msg model = 
    case msg of 
        Nothing ->
            (model, Cmd.none)

subscriptions : Model -> Sub Message
subscriptions model = Sub.none


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
            div [] (List.map (\ elem -> div [] [text elem]) (List.reverse model.console))
            
        ]
    ]

