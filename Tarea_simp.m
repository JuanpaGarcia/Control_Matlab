syms S V B1 B2 K1 K2 M1 M2

fraction = (S*(S*B2+K2))/((M2*S^2+S*B2+K2)*(S^2*M1+S*(B2+B1)+K2+K1)-(S*B2+K2)^2)
simplifyFraction(fraction)
%%
%Run this section after seeing the simplify version
clear S V B1 B2 K1 K2 M1 M2
a = ans;
V=1;B1=1;B2=1;K1=1;K2=1;M1=1;M2=1;
sys = tf([B2,K2,0],[M1*M2, B1*M2+B2*M1+B2*M2, K2*M2+K2*M1+K1*M2+B1*B2,B1*B2+B1*K2, K1*K2]);
step(5*sys);

%%
%linear sym
t = (0:0.01:10);
u = 2+ 3*sin(4*t);
lsim(sys,u,t);grid on