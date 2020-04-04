module Application exposing (main)

import Browser
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Random
import Task
import Time

import Encounter
import Pakedex
import World


type alias Model = {
        console: List String,
        pakedex: Pakedex.Pakedex,
        world: World.World
    }

type Message 
    = AddConsole String
    | Timer Time.Posix
    | TryEncounter Time.Posix Bool 
    | MakeEncounter Encounter.Encounter

main : Program () Model Message
main = Browser.element { init = init, view = view, update = update, subscriptions = subscriptions }

init : () -> (Model, Cmd Message)
init _ = (Model ["Welcome to Pakeman !"] Pakedex.init World.init, Cmd.none)
 
update : Message -> Model -> (Model, Cmd Message)
update msg model = 
    case msg of 
        AddConsole entry -> 
            ({ model | console = List.append [entry] model.console}, Cmd.none)
        Timer time -> 
            ({ model |
                world = World.freeEncounter model.world time
            }, 
                if World.canEncounter model.world
                then Random.generate (TryEncounter time) Encounter.genTryEncounter
                else Cmd.none
            )
        TryEncounter time possible  ->
            (model, 
                if possible
                then Random.generate MakeEncounter (Encounter.genEncounter time model.world.currentZone)
                else Cmd.none
            )
        MakeEncounter encounter -> 
            let pakeman = Pakedex.getPakeman model.pakedex encounter.pakemanId
            in 
            ({model | 
                world = World.addEncounter encounter model.world,
                pakedex = Pakedex.addSeenPakeman model.pakedex encounter.pakemanId
            }, 
            if not (Pakedex.hasSeenPakeman model.pakedex encounter.pakemanId)
            then cmdAddConsole ("Wow ! A " ++ pakeman.name ++ ", wild !")
            else Cmd.none)


cmdAddConsole: String -> Cmd Message
cmdAddConsole entry =
    Task.perform (\_ -> AddConsole entry)  (Task.succeed 1)

    

subscriptions : Model -> Sub Message
subscriptions _ = 
    Time.every 1000 Timer


view : Model -> Html Message
view model =
    div [class "flex"] [
        div [class "w-25"] [
            Html.h3 [] [text "Pakedex listing"],
            Pakedex.view model.pakedex
        ],
        div [class "w-50"] [
            World.view model.world model.pakedex
        ],
        div [class "w-25"] [
            Html.h3 [] [text "Pakedex messenger"],
            div [] (List.map (\ elem -> div [] [text elem]) model.console)
        ]
    ]
