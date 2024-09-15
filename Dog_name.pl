% Facts about animals and their sizes
dog(fido).
dog(rover).
dog(jane).
dog(tom).
dog(fred).
dog(henry).
cat(mary).
cat(harry).
cat(bill).
cat(steve).

% Size facts
small(henry).
medium(harry).
medium(fred).
large(fido).
large(mary).
large(tom).
large(fred).
large(steve).
large(jim).
large(mike).
dog_size(Name, Size) :-
    dog(Name),
    (   small(Name) -> Size = small
    ;   medium(Name) -> Size = medium
    ;   large(Name) -> Size = large
    ;   Size = unknown).
