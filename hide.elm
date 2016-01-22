module Hide (getPlace) where
import String

type Place
  = Valid String
  | Invalid


getPlace name =
  if String.length name > 4
    then Valid name
    else Invalid
