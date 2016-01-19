import Html exposing (..)
import Html.Events as E
import Signal

type Action
  = Idle
  | Click

actionMailbox = Signal.mailbox Idle

view : Signal.Address Action -> Action -> Html.Html
view address action =
  let x = Debug.log "action" action
  in
    body []
      [ strong [] [ text "click the button bellow" ]
      , br [] []
      , button [ E.onClick address Click ] [ text "click me!" ]
      ]

viewWithAddress = view actionMailbox.address

main = Signal.map viewWithAddress actionMailbox.signal  
