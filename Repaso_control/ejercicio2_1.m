k=0.5;
b=1;
m=1;
A = [0,1;-k/m, -b/m];
B = [0;1/m];
eigs(A)
Mc = [B, A*B];
det(Mc)