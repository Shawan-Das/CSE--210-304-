% Author: Shawan Das(19101020)
% Date: 8/12/2022

%                       ------- Gender -----------
male(joyonto).   female(joti).
male(haripodo).   female(anjona).
male(sajal).   female(lipika).
male(motilal).   female(archana).
male(oboni).   female(sadhona).
male(sibu).   female(sima).
male(loknath).   female(jaba).
male(bishowjit).   female(tora).
male(atindro).   female(jamuna).
male(anirban).   female(prantika).
male(protoy).   female(parmita).
male(shishir).   female(shyma).
male(shawan).    female(gulu).

%                       -------Declare Facts-----------

%---------- 4th gen-------
father(anirban, gulu).
mother(prantika, gulu).

%---------- 3rd gen--------
father(atindro, prantika).
mother(jamuna, prantika).
father(bishowjit, protoy).
mother(tora, protoy).
father(bishowjit, parmita).
mother(tora, parmita).
father(loknath, shawan).
mother(jaba, shawan).
father(sibu, shishir).
mother(sima, shishir).
father(sibu, shyma).
mother(sima, shyma).

%---------- 2nd gen-------
father(oboni, sibu).
mother(sadhona, sibu).
father(oboni, loknath).
mother(sadhona, loknath).
father(oboni, bishowjit).
mother(sadhona, bishowjit).
father(motilal, atindro).
mother(archana, atindro).

% -------- 1st gen--------
father(haripodo, oboni).
mother(anjona, oboni).
father(sajal, archana).
mother(lipika, archana).


%------- order -------
father(joyonto, anjona).
mother(joti, anjona).
father(joyonto, sajal).
mother(joti, sajal).

%                       -------Declare Rules-----------

same(X,Y):- X=Y.
child(X,Y):- parent(Y,X).

parent(X,Y):-
    father(X,Y); mother(X,Y).  % X is parent of Y if X is father/mother of Y

sibling(X,Y):-
    father(Z,X), father(Z,Y), not(same(X,Y)).
    % 'X-Y sibling if Z is parent of both X-Y and X-Y is not the same person.'

cousin(X,Y):-
    grandfather(A,X), grandfather(A,Y), not(sibling(X,Y)), not(same(X,Y)).
    % 'X is cousin of Y if parents of X & Y s are sibling.'

grandfather(X, Y):-
    parent(Z,Y), parent(X,Z), male(X).
    % 'X is grandfather of Y if Z is parent of Y and X is parent of Z'

grandparent(X,Y):-
    parent(Z,Y), parent(X,Z).
    % 'X is grandparent of Y if Z is parent of Y and X is parent of Z'

great_grandparent(X,Y):-
    parent(Z,Y), grandparent(X,Z).
    % 'X is great grandparent of Y if Z is parent of Y and X is grandparent of Z' 

great_great_grandparent(X,Y):-
    parent(Z,Y), great_grandparent(X,Z).
    % 'X is great great grandparent of Y if Z is gparent of Y and X is great grandparent of Z' 

great_grandfather(X,Y):-
    parent(Z,Y), grandfather(X,Z), male(X).
    % 'X is great-grandfather of Y if parent of Y s grandfather is X'.
    
great_great_grandfather(X,Y):-
    parent(Z,Y), great_grandfather(X, Z), male(X).
    % 'parent of Y s great grandparent is X.'

% ------ 2nd/3rd cousin ---------
secondCousin(X,Y):-
    great_grandfather(Z,X),  great_grandfather(Z,Y),
    grandfather(A,X),        not(grandfather(A,Y)),
    not(sibling(X,Y)),      not(cousin(X,Y)),
    not(same(X,Y)).
    % 'Great grandparents of X & Y are same but X & Y are not Sibling or Cousin or not same person.'

thirdCousin(X,Y):-
    great_great_grandfather(Z,X),    great_great_grandfather(Z,Y),
    great_grandfather(A,X),          not(great_grandfather(A,Y)),
    not(sibling(X,Y)), not(cousin(X,Y)), not(same(X,Y)).
    % 'great great grandparent of X & Y are same and X-Y are not sibling/cousin.'


%    ---------- 1st cousin removed --------------
fcor(X,Y):-     % 'fcor - First Cousin Once Removed'
    parent(Z,X), cousin(Z,Y).
    % 'parent of X (Z) and Y are cousins.'

fctr(X,Y):-     % 'fctr - first cousin twice removed'
    grandparent(Z,X), cousin(Z,Y). 
    % 'grandparent of X(Z) are cousins'.

fcthr(X, Y):-   % 'fcthr - First Cousin 3rd removed'\
    great_grandparent(Z,X), cousin(Z,Y).
    % 'great grandparent of X(Z) are cousins'.

fcfr(X, Y):-    % 'first Cousin 4th removed'.
    great_great_grandfather(Z,X), cousin(Z,Y).
    % 'great great grandparent of X(Z) are cousins'.


%     ------------  2nd Cousin removed --------------
scor(X,Y):-     % '2nd Cousin First removed'
    secondCousin(Z,Y), parent(Z,X).
    % 'parent of X(Z) are  2nd cousins.'

sctr(X,Y):-     % '2nd Cousin 2nd Removed'
    secondCousin(Z,Y), grandparent(Z,X).
    % 'grandparent of X(Z) are  2nd cousins.'

scthr(X, Y):-   % '2nd Cousin 3rd removed'.
    secondCousin(Z,Y), great_grandparent(Z,X).
    % 'great grandparent of X(Z) are  2nd cousins.'

scfr(X, Y):-   % '2nd cousin 4th removed.'
    secondCousin(Z,Y), great_great_grandparent(Z, X).
    % 'great great grandparent of X(Z) are  2nd cousins.'


%     ------------  3rd Cousin removed --------------
tcor(X,Y):-     % '3rd Cousin First removed'
    thirdCousin(Z,Y), parent(Z,X).
    % 'parent of X(Z) are  2nd cousins.'

tctr(X,Y):-     % '3rd Cousin 2nd Removed'
    thirdCousin(Z,Y), grandparent(Z,X).
    % 'grandparent of X(Z) are  2nd cousins.'

tcthr(X, Y):-   % '3rd Cousin 3rd removed'.
    thirdCousin(Z,Y), great_grandparent(Z,X).
    % 'great grandparent of X(Z) are  2nd cousins.'

tcfr(X, Y):-   % '3rd cousin 4th removed.'
    thirdCousin(Z,Y), great_great_grandparent(Z, X).
    % 'great great grandparent of X(Z) are  2nd cousins.'
