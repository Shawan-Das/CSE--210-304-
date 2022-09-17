% Author: Shawan Das(19101020)
% Date: 17/09/2022


% ------------- Facts -----------

%Entity : Speeking- Excellent/poor, viva- good/bad, cgpa- good/marginal %

speaking(shawan, poor).
speaking(tanmoy, excellent).
speaking(hasib, excellent).
speaking(zarin, excellent).
speaking(vabna, excellent).
speaking(anannya, excellent).
speaking(prachi, excellent).


viva(shawan, bad).
viva(tanmoy, good).
viva(hasib, good).
viva(zarin, bad).
viva(vabna, good).
viva(anannya, good).
viva(prachi, good).

cgpa(shawan, marginal).
cgpa(tanmoy, marginal).
cgpa(hasib, marginal).
cgpa(zarin, good).
cgpa(vabna, marginal).
cgpa(anannya, bad).
cgpa(prachi, marginal).




%----------- Rules------------%
selected(X):-
    speaking(X,excellent),
    (viva(X,good); cgpa(X,good)).

not_selected(X):-
    (
    speaking(X,poor),
    (viva(X,bad); cgpa(X,marginal))
        );
        not(selected(X)).


