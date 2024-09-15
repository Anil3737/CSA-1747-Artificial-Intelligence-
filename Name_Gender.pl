% Facts: person(Name, Surname, Gender, Age, Profession)
person(frances, wilson, female, 28, architect).
person(fred, jones, male, 62, doctor).
person(paul, smith, male, 45, plumber).
person(martin, williams, male, 23, chemist).
person(mary, jones, female, 24, programmer).
person(martin, johnson, male, 47, solicitor).

% Rule to determine if a person is male
man(Name) :-
    person(Name, _, male, _, _).

% Rule to determine if a person is female
woman(Name) :-
    person(Name, _, female, _, _).

% Rule to determine if a person is a specific profession
profession(Name, Profession) :-
    person(Name, _, _, _, Profession).

% Rule to determine if a person is above a certain age
above_age(Name, AgeLimit) :-
    person(Name, _, _, Age, _),
    Age > AgeLimit.
