% Facts representing which students study which subjects
studies(charlie, csc135).
studies(olivia, csc135).
studies(jack, csc131).
studies(arthur, csc134).

% Facts representing which teachers teach which subjects
teaches(kirke, csc135).
teaches(collins, csc131).
teaches(collins, csc171).
teaches(juniper, csc134).

% Rule to determine if X is a professor for Y
professor(X, Y) :-
    teaches(X, C),
    studies(Y, C).
