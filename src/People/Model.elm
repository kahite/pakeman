module People.Model exposing (People, Identity(..), getMessageColor, getName, narrator)


type alias People = {
        identity: Identity,
        name: String,
        welcomeText: String,
        messageColor: String,
        backgroundColor: String,
        textColor: String
    }

type Identity 
    = Narrator
    | Mum
    | ProfChichon


narrator: People
narrator = People Narrator "" "" "" "" ""

getName: People -> String
getName people = people.name

getMessageColor: People -> String
getMessageColor people = people.messageColor