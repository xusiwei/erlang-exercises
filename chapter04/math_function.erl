% vim set ts=4 sw=4 et
-module(math_function).
-export([even/1, odd/1, filter/2, split/1, split2/1, test/0]).

even(N) -> N rem 2 =:= 0.

odd(N) -> even(N) =:= false.

filter(F, L) -> [X || X <- L, F(X)].

split(L) -> 
    EF = fun(X) -> even(X) end,
    OF = fun(X) -> odd(X) end,
    {filter(EF, L), filter(OF, L)}.

split2(L) -> split_acc(L, [], []).

split_acc([H|T], Evens, Odds) ->
    case (H rem 2) of
        1 -> split_acc(T, Evens, [H|Odds]);
        0 -> split_acc(T, [H|Evens], Odds)
    end;
split_acc([], Evens, Odds) ->
    {lists:reverse(Evens), lists:reverse(Odds)}.

test() ->
    All = lists:seq(1, 10),
    Odds = [1,3,5,7,9],
    Evens = [2,4,6,8,10],
    Odds = filter(fun(X) -> odd(X) end, All),
    Evens = filter(fun(X) -> even(X) end, All),
    {Evens, Odds} = split(All),
    {Evens, Odds} = split2(All),
    {ok, done}.

