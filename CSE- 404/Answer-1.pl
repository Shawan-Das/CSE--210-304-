% Author: Shawan Das(19101020)
% Date: 17/09/2022

%---------------Facts-------
friends(maria, william). % maria is friend of william
friends(william, david). % william is friend of david


% --------------- Rules -----------
friend_of(A,B):-
    friends(A,B).

mutual_friend(A,B):-
    not(A=B),
    not(friends(A,B)), 
    (friend_of(A,X), friend_of(B,X));
    (friend_of(X,A), friend_of(X,B));
    (friend_of(A,X), friend_of(X,B));
    (friend_of(X,A), friend_of(B,X)).
