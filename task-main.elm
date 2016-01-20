module Main where
import Html exposing (..)
import Html.Events as E
import Random.Extras as Rex
import Task
import Signal

type alias Model = Float

type Action
  = Idle
  | GetRandom

actMailbox = Signal.mailbox Idle
rndMailbox = Signal.mailbox 0.0

view : Signal.Address Action -> Model -> Html
view a m =
  div []
    [ h1 [] [ text "Random from js: ", text <| toString m ]
    , button [ E.onClick a GetRandom ] [ text "Get random" ]
  ]

port taskRunner : Signal.Signal (Task.Task x ())
port taskRunner =
  Signal.map (\_ -> Rex.random `Task.andThen` (Signal.send rndMailbox.address) ) actMailbox.signal

main = Signal.map (view actMailbox.address) rndMailbox.signal
