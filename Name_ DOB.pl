born(jan, 20, 3, 1977).
born(jeroen, 2, 2, 1992).
born(joris, 17, 3, 1995).
born(jelle, 1, 1, 2004).
born(jesus, 24, 12, 2000).
born(joop, 30, 4, 1989).
born(jannecke, 17, 3, 1993).
born(jaap, 16, 11, 1995).

born_on(Name, Day, Month, Year) :-
    born(Name, Day, Month, Year).
born_in_year(Name, Year) :-
    born(Name, _, _, Year).
born_in_month(Name, Month) :-
    born(Name, _, Month, _).
born_on_day_month(Name, Day, Month) :-
    born(Name, Day, Month, _).
