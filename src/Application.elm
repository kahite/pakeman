module Application exposing (main)

import Browser
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Random
import Time

import Encounter
import Pakedex
import PakeMessenger as Messenger
import People.Model as People
import World


type alias Model = {
        pakedex: Pakedex.Pakedex,
        world: World.World,
        messenger: Messenger.Messenger
    }

type Message 
    = Timer Time.Posix
    | TryEncounter Time.Posix Bool 
    | MakeEncounter Encounter.Encounter
    | WorldMessage World.Message
    | MessengerMessage Messenger.Message

main : Program () Model Message
main = Browser.element { init = init, view = view, update = update, subscriptions = subscriptions }

init : () -> (Model, Cmd Message)
init _ = (
        Model Pakedex.init World.init Messenger.init, 
        Cmd.map (\ cmdMessage -> MessengerMessage cmdMessage) 
            (Messenger.cmdAddComment (Messenger.Comment People.narrator "Welcome to Pakeman !"))
    )
 
update : Message -> Model -> (Model, Cmd Message)
update msg model = 
    case msg of 
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
            then Cmd.map (\ cmdMessage -> MessengerMessage cmdMessage) 
                (Messenger.cmdAddComment (Messenger.Comment People.narrator ("Wow ! A " ++ pakeman.name ++ ", wild !")))
            else Cmd.none)
        WorldMessage worldMessage ->
            case worldMessage of
                World.TalkTo people ->
                    (model, 
                        Cmd.map (\ cmdMessage -> MessengerMessage cmdMessage) 
                            (Messenger.cmdAddComment (Messenger.Comment people people.welcomeText))
                    )
                _ ->
                    ({model | world = World.update worldMessage model.world}, Cmd.none)
        MessengerMessage messengerMessage -> 
            ({model | messenger = Messenger.update messengerMessage model.messenger}, Cmd.none)



subscriptions : Model -> Sub Message
subscriptions _ = 
    Time.every 1000 Timer


view : Model -> Html Message
view model =
    div [class "flex"] [
        div [class "w-25 pa3"] [
            Html.h3 [] [text "Pakedex listing"],
            Pakedex.view model.pakedex
        ],
        div [class "w-50 pa3"] [
            Html.map (\ msg -> WorldMessage msg) (World.view model.world model.pakedex)
        ],
        div [class "w-25 pa3"] [
            Html.map (\ msg -> MessengerMessage msg) (Messenger.view model.messenger)
        ]
    ]
