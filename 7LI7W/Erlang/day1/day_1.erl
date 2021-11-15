-module(day_1).
-export([count_words/1, count_to/1, status/1]).

% 1.
count_words(String) -> count_list(string:split(String, " ", all)).

count_list([]) -> 0;
count_list([_ | Tail]) -> 1 + count_list(Tail).

% 2. 
println(Text) -> io:format("~p", [Text]), io:nl().

count_to(0) -> println("Done");
count_to(Number) -> println(Number), count_to(Number - 1).

% 3.
status(success) -> println("success");
status({error, Message}) -> io:format("error:~p~n", [Message]).