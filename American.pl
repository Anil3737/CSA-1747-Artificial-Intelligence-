% Facts
american(robert).                % Robert is an American
missile(m1).                      % m1 is a missile
owns(countryA, m1).               % Country A owns missile m1
enemy(countryA, america).         % Country A is an enemy (hostile nation)
sold(robert, m1, countryA).       % Robert sold missile m1 to Country A

% Rule: It is a crime for an American to sell weapons to a hostile nation.
crime(X) :-
    american(X),                 % X is an American
    sold(X, Y, Z),               % X sold item Y to country Z
    missile(Y),                  % Y is a missile (i.e., a weapon)
    enemy(Z, america).           % Z is a hostile nation (enemy of America)

% Query to prove Robert is a criminal
criminal(robert) :-
    crime(robert).
