import Graphics.Element exposing(show)
import Mouse
import Signal

main = Signal.map show Mouse.position  
