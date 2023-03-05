mulher(pam).
mulher(ann).
mulher(liz).
mulher(pat).
homem(tom).
homem(bob).
homem(jim).
genitor(pam,bob).
genitor(tom,bob).
genitor(tom,liz).
genitor(bob,ann).
genitor(bob,pat).
genitor(pat,jim).

/*Consultas */

% Quem são os filhos de bob
genitor(bob,X). 
