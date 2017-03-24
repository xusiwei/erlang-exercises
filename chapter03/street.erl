-module(street).
-export([create/1, add_hourse/2, get_hourse/2]).

create(Hourse) -> [Hourse].

add_hourse(Street, Hourse) ->
    L0 = lists:reverse(Street),
    lists:reverse([Hourse | L0]).

get_hourse(Street, Index) ->
    [H | T] = Street,
    case Index of
        0 -> H;
        Index -> get_hourse(T, Index - 1)
    end.
