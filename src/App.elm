port module App exposing (..)

import Views
import Controllers exposing (Msg)
import Models exposing (Model, emptyModel)

import Html exposing (..)

-- Somehow Elm knows this is the entry point for the application.
-- http://package.elm-lang.org/packages/elm-lang/html/2.0.0/Html
main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = Views.view
        , update = Controllers.update
        , subscriptions = \_ -> Sub.none
        }

-- Describe the initial state and startup operations to the runtime.
init : ( Model, Cmd Msg )
init =
    Models.emptyModel ! []
