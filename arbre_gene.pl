male(pierre).
male(jules).
male(paul).
male(leo).
male(marc).
male(albert).
male(arthur).
male(leopold).

femelle(marie).
femelle(chloe).
femelle(cathy).
femelle(lea).
femelle(sophie).
femelle(julie).

enfant(jules,pierre).
enfant(paul,pierre).
enfant(lea,pierre).
enfant(jules,marie).
enfant(paul,marie).
enfant(lea,marie).
enfant(marc,chloe).
enfant(sophie,chloe).
enfant(julie,chloe).
enfant(marc,jules).
enfant(sophie,jules).
enfant(julie,jules).
enfant(albert,paul).
enfant(albert,cathy).
enfant(arthur,lea).
enfant(arthur,leo).
enfant(leopold,lea).
enfant(leopold,leo).

mari(pierre,marie).
mari(jules,chloe).
mari(paul,cathy).
mari(leo,lea).

pere(X,Y) :- enfant(Y,X),male(X).
mere(X,Y) :- enfant(Y,X),femelle(X).
grandpere(X,Y) :- pere(X,Z),pere(Z,Y).
grandpere(X,Y) :- pere(X,Z),mere(Z,Y).
individus(X) :- male(X).
individus(X) :- femelle(X).
grandmere(X,Y) :- mere(X,Z), mere(Z,Y).
grandmere(X,Y) :- mere(X,Z), pere(Z,Y).
frere(X,Y) :- pere(Parent,X),pere(Parent,Y),male(X), X\==Y.
soeur(X,Y) :- pere(Parent,X),pere(Parent,Y),femelle(X), X\==Y.
femme(X,Y) :- mari(Y,X).
oncle(X,Y) :- frere(X,Pere), pere(Pere,Y).
oncle(X,Y) :- frere(X,Mere), mere(Mere,Y).
oncle(X,Y) :- mari(X,Tante), soeur(Tante,Parent), enfant(Y,Parent).
tante(X,Y) :- soeur(X,Pere), pere(Pere,Y).
tante(X,Y) :- soeur(X,Mere), mere(Mere,Y).
tante(X,Y) :- femme(X,Oncle), frere(Oncle,Parent), enfant(Y,Parent).
cousin(X,Y) :- enfant(X,Z), oncle(Z,Y).
cousin(X,Y) :- enfant(X,Z), tante(Z,Y).
beaufrere(X,Y) :- frere(X,Femme), femme(Femme,Y).
beaufrere(X,Y) :- frere(X,Mari), mari(Mari,Y).
beaufrere(X,Y) :- mari(X,Soeur), soeur(Soeur,Y).
bellesoeur(X,Y) :- soeur(X,Mari), mari(Mari,Y).
bellesoeur(X,Y) :- soeur(X,Femme), femme(Femme,Y).
bellesoeur(X,Y) :- femme(X,Frere), frere(Frere,Y).
gendre(X,Y) :- mari(X,Enfant), enfant(Enfant, Y).
brue(X,Y) :- femme(X,Enfant), enfant(Enfant, Y).
beaupere(X,Y) :- gendre(Y,X), male(X).
beaupere(X,Y) :- brue(Y,X), male(X).
bellemere(X,Y) :- gendre(Y,X), femelle(X).
bellemere(X,Y) :- brue(Y,X), femelle(X).
grandparent(X,Y) :- grandpere(X,Y).
grandparent(X,Y) :- grandmere(X,Y).
ancetre(X,Y) :- enfant(Y,X).
ancetre(X,Y) :- enfant(Y,Z), ancetre(X,Z).
