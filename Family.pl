% Facts for gender
female(pam).
female(liz).
female(ann).
female(pat).

male(tom).
male(bob).
male(jim).

% Parent-child relationships
parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% Define mother relation: A person X is a mother of Y if X is female and parent of Y
mother(X, Y) :-
    female(X),
    parent(X, Y).

% Define father relation: A person X is a father of Y if X is male and parent of Y
father(X, Y) :-
    male(X),
    parent(X, Y).

% Define grandfather relation: A person X is a grandfather of Y if X is male and parent of Z and Z is a parent of Y
grandfather(X, Y) :-
    male(X),
    parent(X, Z),
    parent(Z, Y).

% Define grandmother relation: A person X is a grandmother of Y if X is female and parent of Z and Z is a parent of Y
grandmother(X, Y) :-
    female(X),
    parent(X, Z),
    parent(Z, Y).

% Define sister relation: X is a sister of Y if X is female and they share the same parent
sister(X, Y) :-
    female(X),
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

% Define brother relation: X is a brother of Y if X is male and they share the same parent
brother(X, Y) :-
    male(X),
    parent(Z, X),
    parent(Z, Y),
    X \= Y.
