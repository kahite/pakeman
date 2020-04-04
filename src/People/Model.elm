module People.Model exposing (People, getMessageColor, getName, narrator, display)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

type alias People = {
        id: Int,
        name: String,
        welcomeText: String,
        messageColor: String,
        backgroundColor: String,
        textColor: String
    }


narrator: People
narrator = People -1 "" "" "" "" ""

display: People -> msg -> Html msg
display people msg = 
    div [onClick msg, class ("relative ba bw1 ma1 pa3 pointer " ++ people.backgroundColor)] [
        div [] [text people.name]
    ]

getName: People -> String
getName people = people.name

getMessageColor: People -> String
getMessageColor people = people.messageColor