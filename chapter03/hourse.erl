-module(hourse).
-export([create/1, add_attribute/3, get_attribute/2]).

create(Owner) -> 
    {hourse, {owner, Owner}}.

add_attribute(Hourse, Key, Value) ->
    L0 = lists:reverse(tuple_to_list(Hourse)),
    L1 = lists:reverse([{Key, Value} | L0]),
    list_to_tuple(L1).

get_attribute(Hourse, Key) ->
    [_ | T] = tuple_to_list(Hourse), % trim head
    get_value(T, Key).

% a helper function to get value from a {key, value} list.
get_value(Pairs, Key) -> 
    [H | T] = Pairs,
    case H of
        [] -> nil;
        {Key, Value} -> Value;
        H -> get_value(T, Key)
    end.


