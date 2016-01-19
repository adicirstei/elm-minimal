module Main where
import Html exposing (..)
import Html.Events as E

import Signal

type alias Model = Int

type Action
  = Idle
  | Increment

actMailbox = Signal.mailbox Idle
initialModel = 77

update : Action -> Model -> Model
update a m =
  m + 1

view : Signal.Address Action -> Model -> Html
view a m =
  div []
    [ h1 [] [ text "Buuuu! ", text <| toString m ]
    , button [ E.onClick a Increment ] [ text "+" ]
  ]


modelStream = Signal.foldp (update) initialModel actMailbox.signal

main = Signal.map (view actMailbox.address) modelStream
