port module App exposing (..)

import Views
import Msg exposing (Msg)
import Model exposing (Model, emptyModel, FirebaseData)
import Update exposing (update)

import Todo.Firebase exposing (TodoFirebase)
-- import Project.Firebase exposing (ProjectFirebase)

import Html exposing (..)

-- Somehow Elm knows this is the entry point for the application.
-- http://package.elm-lang.org/packages/elm-lang/html/2.0.0/Html
main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = Views.view
        , update = update
        , subscriptions = subscriptions
        }

-- Describe the initial state and startup operations to the runtime.
init : ( Model, Cmd Msg )
init =
    Model.emptyModel ! []

-- Creates a port that is intended to act as a subscription to an external event.
port events : (FirebaseData -> msg) -> Sub msg

-- This returns a subscription handler to the Html.program method above.
subscriptions : Model -> Sub Msg
subscriptions model =
    -- Can do some if-statement magic here if necessary. But this doesn't make any sense because
    -- it doesn't depend on the incoming data, but the data you already have in 'model'.
    events Msg.FirebaseUpdate
