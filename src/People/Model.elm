module People.Model exposing (People, getMessageColor, getName, narrator)


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

getName: People -> String
getName people = people.name

getMessageColor: People -> String
getMessageColor people = people.messageColor