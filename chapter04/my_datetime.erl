-module(my_datetime).
-export([my_time_func/1, my_date_string/0]).

my_time_func(F) ->
	{S1, S2, S3} = now(),
	F(),
	{E1, E2, E3} = now(),
	(E1*1000*1000 + E2*1000 + E3)
	- (S1*1000*1000 + S2*1000 + S3).

my_date_string() ->
	{Y, M, D} = date(),
	io_lib:format("~4..0B/~2..0B/~2..0B\n", [Y, M, D]).

% my_datetime:my_time_func(fun() -> io:format(my_datetime:my_date_string()) end).
