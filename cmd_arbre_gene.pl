4.2

enfant(X,jules).
mari(paul,X).
male(X),enfant(X,marie).
femelle(X),male(Y),enfant(X,Y).
male(X),femelle(Y),enfant(X,Z),enfant(Y,Z),male(Z).
femelle(X),enfant(X,Y),enfant(Y,pierre).
enfant(sophie,Parent),male(Oncle),enfant(Parent,GP),enfant(Oncle,GP),Oncle\==Parent.
mari(Mari,chloe),male(BF),enfant(Mari,BP),enfant(BF,BP).

5

pere(X,Y) :- enfant(Y,X),male(X).
mere(X,Y) :- enfant(Y,X),femelle(X).
grandpere(X,Y) :- pere(X,Z),pere(Z,Y).
grandpere(X,Y) :- pere(X,Z),mere(Z,Y).