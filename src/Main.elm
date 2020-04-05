module Main exposing (main)

import Browser

import Message exposing (Message(..))
import Model exposing (Model)
import Subscriptions exposing (subscriptions)
import Update exposing (update)
import View.PakemanApp exposing (view)

main : Program () Model Message
main = 
    Browser.element { 
        init = Model.init, 
        view = view, 
        update = update, 
        subscriptions = subscriptions 
    }

