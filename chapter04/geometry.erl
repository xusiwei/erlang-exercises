-module(geometry).
-export([area/1, perimeter/1]).

area({circle, Radius}) -> math:pi() * Radius * Radius;
area({square, Side}) -> Side * Side;
area({rectangle, Width, Height}) -> Width * Height;
area({triangle, A, B}) -> 0.5 * A * B.

perimeter({circle, Radius}) -> 2 * math:pi() * Radius;
perimeter({square, Side}) -> 4 * Side;
perimeter({rectangle, Width, Height}) -> 2 * (Width + Height);
perimeter({triangle, A, B}) -> A + B + math:sqrt(A*A + B*B).
