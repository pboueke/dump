-module(day_2).
-export([filter_by_keyword/2, get_total_prices/1, silly_tictactoe/1]).

% 1.
filter_by_keyword(List, Keyword) -> [Value || {Key, Value} <- List, Key == Keyword].
% Languages = [{erlang, "FP"}, {ruby, "OO"}].
% day_2: filter_by_keyword(Languages, erlang).

% 2. 
get_total_prices(List) -> [{Item, Quantity * Price} || {Item, Quantity, Price} <- List].
% Cart = [{pencil, 4, 0.25}, {pen, 9, 1.20}, {paper, 20, 0.20}].
% day_2:get_total_prices(Cart).

% 3.
filled(List) -> lists:all(fun(C) -> (C == x) or (C == o) end, List).

silly_tictactoe([R,R,R,_,_,_,_,_,_]) when R /= e -> R;
silly_tictactoe([_,_,_,R,R,R,_,_,_]) when R /= e -> R;
silly_tictactoe([_,_,_,_,_,_,R,R,R]) when R /= e -> R;
silly_tictactoe([C,_,_,C,_,_,C,_,_]) when C /= e -> C;
silly_tictactoe([_,C,_,_,C,_,_,C,_]) when C /= e -> C;
silly_tictactoe([_,_,C,_,_,C,_,_,C]) when C /= e -> C;
silly_tictactoe([D,_,_,_,D,_,_,_,D]) when D /= e -> D;
silly_tictactoe([_,_,D,_,D,_,D,_,_]) when D /= e -> D;
silly_tictactoe(Board) -> 
    case filled(Board) of 
        true -> cat;
        false -> no_winner
    end.
%  day_2:silly_tictactoe([e,e,e,e,e,e,e,e,e]). (empty board)
%  day_2:silly_tictactoe([x,o,o,x,o,x,x,x,o]). (x wins)