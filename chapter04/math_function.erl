-module(math_function).
-export([even/1, odd/1, filter/2, split/1, split2/1]).

even(N) ->
    case N rem 2 of
        0 -> true;
        1 -> false
    end.

odd(N) -> even(N) =:= false.

filter(F, L) -> [X || X <- L, F(X)].

split(L) -> 
    EF = fun(X) -> even(X) end,
    OF = fun(X) -> odd(X) end,
    {filter(EF, L), filter(OF, L)}.

split2(L) -> split_acc(L, [], []).

split_acc(L, Evens, Odds) ->
    case N = length(L) of
        0 -> {lists:reverse(Evens), lists:reverse(Odds)};
        N ->
            [H|T] = L, 
            case (H rem 2) of
                1 -> split_acc(T, Evens, [H|Odds]);
                0 -> split_acc(T, [H|Evens], Odds)
            end
    end.

