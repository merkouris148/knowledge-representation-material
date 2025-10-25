%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Knowledge Representation & Resoning
% Prolog: Tutorial
% ------------------------------------
% Author: Merkouris Papamichail
% Email: merkourisp@csd.uoc.gr
% Last Edit: 7/10/2025
%
% Based on Filippos Gouidis Tutorial
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

person(john).
person(sam).
person(george).
person(sue).
person(jane).
person(june).
person(gina).
person(christos).
person(dimitris).
person(miriam).

child(john, sue). child(sue, gina). child(gina, christos). child(christos, dimitris).
child(jane, sue). child(sue, george). child(georege, miriam).
child(john, sam).
child(jane, sam).


male(john).
male(sam).
male(george).
male(christos).
male(dimitris).

%female(sue).
%female(jane).
%female(june).
%female(gina).

% Negation as Failure
female(X) :- person(X), \+ male(X).

father(X, Y) :- child(Y, X), male(X).
mother(X, Y) :- child(Y, X), female(X).

parent(X, Y) :- father(X, Y).
parent(X, Y) :- mother(X, Y).


grandfather(X, Y) :- father(X, Z), parent(Z, Y).
grandmother(X, Y) :- mother(X, Z), parent(Z, Y).

% This will not work :(
%ancenstor(X, Y) :- parent(X, Y).
%ancenstor(X, Y) :- parent(X, Z), parent(Z, Y).
%ancenstor(X, Y) :- parent(X, Z), parent(Z, W), parent(W, Y).

% That's why, we use recursion!
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
