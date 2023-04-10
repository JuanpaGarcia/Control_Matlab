k=0.5;  b=1; M=1;
A = [0,1;-k/M -b/M];
B = [0;1/M];
C = eye(2);

Mc = [B A*B];