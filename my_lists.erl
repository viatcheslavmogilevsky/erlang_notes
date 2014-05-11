-module(my_lists).
-export([max/1, kth/2, critical_path/1]).

kth(1,[H|_T]) -> H;
kth(K,[_H|T]) -> kth(K-1, T).

max([]) -> 0; %% specific behaviour
max([H]) -> H;
max([H|[H1|T]]) when H >= H1 -> max([H|T]);
max([H|[H1|T]]) when H <  H1 -> max([H1|T]).

critical_path_at(Index, List) -> max([critical_path_at(Number, List) + Dist || {Number, Dist} <- kth(Index, List)]). 

critical_path([]) -> 0;
critical_path(List) -> critical_path_at(length(List), List).






% [
%   [], % 1
%   [{1,6}], % 2
%   [{2, 5}], % 3
%   [{2, 3}], % 4
%   [{2, 4}, {4, 6}], % 5
%   [{4, 4}], % 6
%   [{3, 1}], % 7
%   [{5, 8}], % 8
%   [{4, 7}, {6, 0}], % 9
%   [{7, 6}, {8, 4}, {5, 9}, {9, 3}], % 10
%   [{10, 9}, {6, 5}], % 11
% ]


