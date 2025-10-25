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

child(john, sue).
child(jane, sue).
child(sue, george).
child(john, sam).
child(jane, sam).
child(sue, gina).

male(john).
male(sam).
male(george).

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
