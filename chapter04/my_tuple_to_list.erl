-module(my_tuple_to_list).
-export([to_list/1]).

% convert a tuple to a reverse order list.
to_reverse(T, N) ->
	case N of
		0 -> [];
		N -> [element(N, T) | to_reverse(T, N - 1)]
	end.

% we assume that, the list splited as two part(Left and Right)
%  1) at start, the Right part is empty,
%  2) for each time, we move the head of Left to the head of Right,
%  3) we got result until the Left part is empty, otherwise continue step 2.
reverse_list_helper(Left, Right) ->
	case N = length(Left) of
		0 -> Right;
		N ->
			[Head | Rest] = Left,
			reverse_list_helper(Rest, [Head | Right])
	end.

% reverse a list.
reverse_list(L) -> reverse_list_helper(L, []).	

to_list(T) ->
	N = tuple_size(T),
	reverse_list(to_reverse(T, N)).
	%lists:reverse(to_reverse(T, N)).