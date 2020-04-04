module Type exposing (Type(..), getBgColor)

type Type 
    = Normal
    | Fire
    | Water
    | Grass
    | Electric
    | Ice
    | Fighting
    | Poison
    | Ground
    | Flying
    | Psychic
    | Bug
    | Rock
    | Ghost
    | Dragon
    | Nothing


getBgColor: Type -> String
getBgColor t =
    case t of
        Normal -> "bg-near-white"
        Fire -> "bg-dark-red"
        Water -> "bg-blue"
        Grass -> "bg-green"
        Electric -> "bg-yellow"
        Ice -> "bg-lightest-blue"
        Fighting -> "bg-washed-yellow"
        Poison -> "bg-dark-pink"
        Ground -> "bg-orange"
        Flying -> "bg-silver"
        Psychic -> "bg-pink"
        Bug -> "bg-light-green"
        Rock -> "bg-mid-gray"
        Ghost -> "bg-purple"
        Dragon -> "bg-washed-green"
        Nothing -> "bg-mid-gray"
    