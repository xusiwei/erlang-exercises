-module(mapx).
-export([search/2]).

search(Map, Pred) ->
    search_helper(maps:to_list(Map), Pred).

search_helper([H|T], Pred) ->
    {Key, Value} = H,
    case Pred(Key, Value) of
        true ->
            H;
        false -> 
            search_helper(T, Pred)
    end;
search_helper([], _) ->
    error.
