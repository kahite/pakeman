module Main exposing (main)

import Browser

import Command exposing (cmd)
import Message exposing (Message(..))
import Model exposing (Model)
import Subscriptions exposing (subscriptions)
import Update exposing (update)
import View exposing (view)

main : Program () Model Message
main = 
    Browser.element { 
        init = Model.init, 
        view = view, 
        update = \msg model -> (update msg model, cmd msg model), 
        subscriptions = subscriptions 
    }
