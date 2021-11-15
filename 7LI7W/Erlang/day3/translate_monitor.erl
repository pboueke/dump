-module(translate_monitor).
-export([loop/0]).

loop() ->
    process_flag(trap_exit, true),
    receive
        new ->
            register(translator, spawn_link(fun translate:loop/0)),
            loop();
        {'EXIT', From, Reason} ->
            io:format("The translate process ~p died because ~p. Restarting.", [From, Reason]),
            self() ! new,
            loop()
    end.