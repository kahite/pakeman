module People.Model exposing (People, Identity(..), display)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)


type alias People = {
        name: String,
        identity: Identity,
        welcomeText: String
    }

type Identity
    = Nothing
    | ProfChon


display: People -> Html msg
display people = 
    div [class "relative ba bw1 ma1 pa3 bg-near-white"] [
        div [] [text people.name]
    ]
