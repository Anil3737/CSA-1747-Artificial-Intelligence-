% Define symptoms and their associated diseases
symptom(fever, flu).
symptom(cough, cold).
symptom(runny_nose, cold).
symptom(sore_throat, flu).
symptom(body_aches, flu).

% Define rules for diagnosing diseases
diagnose(Disease) :- has_symptom(Symptom, Disease).

% Predicate to check if the patient has a symptom
has_symptom(Symptom, Disease) :-
    symptom(Symptom, Disease),
    writef("Do you have %w? (yes/no): ", [Symptom]),
    read(Response),
    Response = yes.

% Main predicate
main :-
    writeln("Welcome to the Health Diagnosis System!"),
    writeln("Please answer the following questions to help us diagnose your condition."),
    diagnose(Disease),
    format("Based on your symptoms, you may have %w.~n", [Disease]).

% Example usage
:- main.
