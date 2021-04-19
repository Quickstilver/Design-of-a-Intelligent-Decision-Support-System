set of int : ITEMA;   %cluster di problemi numerati consecutivamente
set of int: ITEMB;
set of int: ITEMC;
int: budget;          % budget riorse a diposizione

array[ITEMA union ITEMB union ITEMC] of 1..4: prior;    % priorità di ogni problema

array[ITEMA union ITEMB union ITEMC] of int: costi;    % costo di ogni problema

var set of ITEMA union ITEMB union ITEMC: problrisolti;    %insieme dei problemi risolvibili con quel dato budget/priorità

constraint sum (i in problrisolti) (costi[i]) <= budget;    %costo problemi minore del budget

solve maximize sum (i in problrisolti) (prior[i]) ;         % massimizzare la risoluzione di problemi con priorità alta


var int: destinazionefondiA= sum(i in (problrisolti intersect ITEMA))(costi[i]);     % quantità di fondi da destinare ad ogni cluster

var int: destinazionefondiB= sum(i in (problrisolti intersect ITEMB))(costi[i]);

var int: destinazionefondiC= sum(i in (problrisolti intersect ITEMC))(costi[i]);

output ["problrisolti = \(problrisolti)\n"++"destinazionefondiA=\(destinazionefondiA)\n"++"destinazionefondiB=\(destinazionefondiB)\n"++"destinazionefondiC=\(destinazionefondiC)"];
