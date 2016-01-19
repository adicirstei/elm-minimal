module Main where
import Html exposing (..)
import Html.Events as E
import Html.Attributes as A
import Signal

type alias Model = Int

type Action
  = Idle
  | Animate

actMailbox = Signal.mailbox Idle
initialModel = 77

update : Action -> Model -> Model
update a m =
  m + 10

view : Signal.Address Action -> Model -> Html
view a m =
  div []
    [ h1 [ A.style [("position", "absolute") , ("left", (toString m) ++ "px") ] ] [ text "Buuuu! ", text <| toString m ]
    , button [ E.onClick a Animate ] [ text "Animate" ]
  ]


modelStream = Signal.foldp (update) initialModel actMailbox.signal

main = Signal.map (view actMailbox.address) modelStream
