% Initial state: the monkey is at the door, chair at window, stick at door, and bananas at the middle of the room
initial_state(state(at_door, on_floor, at_window, at_door, has_not)).

% Goal state: the monkey has the bananas
goal_state(state(_, _, _, _, has)).

% Action to move the monkey from one position to another
move(state(MonkeyPos, on_floor, ChairPos, StickPos, HasBananas),
     move(MonkeyPos, NewPos),
     state(NewPos, on_floor, ChairPos, StickPos, HasBananas)).

% Action to pick up the stick when the monkey is at the same position as the stick
move(state(MonkeyPos, on_floor, ChairPos, MonkeyPos, has_not),
     grab_stick,
     state(MonkeyPos, on_floor, ChairPos, MonkeyPos, has_stick)).

% Action to push the chair from one position to another
move(state(MonkeyPos, on_floor, MonkeyPos, StickPos, HasBananas),
     push_chair(MonkeyPos, NewPos),
     state(NewPos, on_floor, NewPos, StickPos, HasBananas)).

% Action to climb on the chair when the monkey and chair are in the same position
move(state(MonkeyPos, on_floor, MonkeyPos, StickPos, has_stick),
     climb_chair,
     state(MonkeyPos, on_chair, MonkeyPos, StickPos, has_% Define the initial state:
% monkey's position, bananas' position, chair's position, stick's position, whether the monkey is holding the stick, and whether the bananas are obtained.
initial_state(state(at_door, at_window, at_window, at_door, has_not, has_not)).

% Define the goal state: the monkey has the bananas.
goal_state(state(_, _, _, _, _, has)).

% Actions:
% The monkey can walk, pick up objects, climb the chair, or wave the stick to knock down the bananas.

% The monkey walks from one position to another.
move(state(MonkeyPos, BananasPos, ChairPos, StickPos, HasStick, Bananas),
     walk(MonkeyPos, NewPos),
     state(NewPos, BananasPos, ChairPos, StickPos, HasStick, Bananas)) :-
     MonkeyPos \= NewPos.

% The monkey can carry the stick if it is in the same position as the stick.
move(state(MonkeyPos, BananasPos, ChairPos, StickPos, has_not, Bananas),
     pick_up_stick,
     state(MonkeyPos, BananasPos, ChairPos, MonkeyPos, has, Bananas)) :-
     MonkeyPos = StickPos.

% The monkey can climb onto the chair if it is in the same position as the chair.
move(state(MonkeyPos, BananasPos, ChairPos, StickPos, HasStick, Bananas),
     climb_chair,
     state(on_chair, BananasPos, ChairPos, StickPos, HasStick, Bananas)) :-
     MonkeyPos = ChairPos.

% The monkey can wave the stick to knock down the bananas if it is on the chair and has the stick.
move(state(on_chair, BananasPos, ChairPos, StickPos, has, has_not),
     wave_stick,
     state(on_chair, BananasPos, ChairPos, StickPos, has, has)).

% The sequence of actions to achieve the goal.
solve_problem(State, _, []) :- goal_state(State).
solve_problem(State, Visited, [Action|Actions]) :-
    move(State, Action, NewState),
    \+ member(NewState, Visited),  % Ensure no repetition of states
    solve_problem(NewState, [NewState|Visited], Actions).

% Start the problem-solving process from the initial state.
solve_monkey_bananas(Actions) :-
    initial_state(State),
    solve_problem(State, [State], Actions).
