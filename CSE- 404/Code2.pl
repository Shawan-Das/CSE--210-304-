% Author: Shawan Das
% Date: 7/26/2022
friend_of(X,Y):-
    friend_of(X,Z),
    friend_of(Z,Y),
    friend_of(X,Z),
    friend_of(Y,Z).


friend_of(jack,moon).
friend_of(moon,jill).





