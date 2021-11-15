-module(translate).
-export([loop/0]).

loop() ->
  receive
    "casa" ->
      io:format("house~n"),
      loop();

    "blanca" ->
      io:format( "white~n"),
      loop();

    "pizza" ->
        io:format( "Oh oh..~n"),
        exit({translate,die,at,erlang:time()});

    _ ->
      io:format("I don't understand.~n"),
      loop()
  end.