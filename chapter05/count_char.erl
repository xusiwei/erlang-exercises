-module(count_char).
-export([count_char/1]).

count_char(Str) ->
    count_char(Str, #{}).

count_char([H|T], X) ->
    case X of
        #{H := N} ->
            count_char(T, X#{H := N+1});
        X ->
            count_char(T, X#{H => 1})
    end;
count_char([], X) -> X.
