import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

main =
  Browser.sandbox { init = 0, update = update, view = view }

-- 1. 
product list = 
  case list of
    [] ->
      1
    
    head::tail ->
      head * product tail

-- 2.
getAllXs list = List.map (\e -> e.x) list

-- 5. 
multiply a b = a * b

-- 6.
canDrive people = List.filter (\p -> p.age > 16) people

update msg model =
  case msg of
    _ -> model

view model =
  div []
    [ 
      text <| String.fromInt <| product [1,2,3,4,5],
      text <| String.fromInt <| (multiply 6) 8
    ]