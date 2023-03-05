k_esimoDigito(N,K,R):- K=1,R is mod(N,10).
k_esimoDigito(N,K,R):- K1 is K-1, N1 is N//10, k_esimoDigito(N1,K1,R1), R is R1.
