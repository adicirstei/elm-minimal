import Html exposing(..)
import Time
import Date
import Signal

tostr : Int -> String
tostr n =
  if n < 10 then "0" ++ toString n else toString n


clock : Time.Time -> Html
clock t =
  let d = Date.fromTime t
  in
    h1
      []
      [ text <| tostr <| Date.hour d
      , text ":"
      , text <| tostr <| Date.minute d
      , text ":"
      , text <| tostr <| Date.second d
      ]

main = Signal.map clock (Time.every Time.second)  
