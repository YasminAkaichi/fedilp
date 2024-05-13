set(verbose,0).

% Mode declarations
modeh(*,daughter(+person,-person)).
modeb(*,parent(+person,-person)).
modeb(*,parent(-person,+person)).
modeb(*,female(+person)).
modeb(*,female(-person)).

% Determinations
determination(daughter/2,parent/2).
determination(daughter/2,female/1).

% Background knowledge
:- begin_bg.
person(ann). person(mary). person(tom). person(eve). person(lucy).
female(ann). female(mary).              female(eve). female(lucy).
parent(ann,mary). 
parent(ann,tom). 
parent(tom,eve). 
parent(tom,lucy).
:- end_bg.
    
% Positive examples
:- begin_in_pos.
daughter(lucy,tom).
daughter(mary,ann).
daughter(eve,tom).
:- end_in_pos.

% Negative examples
:- begin_in_neg.
daughter(tom,ann).
daughter(tom,eve).
daughter(ann,tom).
:- end_in_neg.