clc
close all
xO = [2 0];// initial conditions

 % Sys param
 M=2; b=6; k=4;

%system matrixes

A = [0, 1; -k/M, -b/M]
B = [0; 1/M]
C= [1,0];
D = 0;
% state sapce definition
Masspring_sys = ss(A,B,C,D)

%plot
%initial conditions
[y,t,X] = initial(Masspring_sys, xO);
figure;
subplot(2,1,1);
plot(t, X(:,1)); title('Estado 1'); grid;
plot(t, X(:,2)); title('Estado 1'); grid;

% Sinusoidal input
t = (0:0.01:10);
u = 2*sin(t);
[y,t,X] = lsim(Masspring_sys, u, t, xO);
figure;
plot(t, X(:,1)); title('Estado 1'); grid;
plot(t, X(:,2)); title('Estado 1'); grid;
