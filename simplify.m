clear all
syms M1 M2 K B S

fraction = (M1*S^2 + K+B*S -(K^2/(K+M2*S^2)));
simplifyFraction(fraction)

%%
clear all
M1=1; M2=1; K=1; B=1;
a = [M2,0,K]
sys = tf([M2,0,K],[M1*M2,B*M2,K*M1+K*M2,B*K,0])
step(sys)