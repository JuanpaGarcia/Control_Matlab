clear all;
clc;

L=1;Jm=1;J=1;Ra=1;B=1;Bm=1;kb=1;kt=1;k=1;
sys = tf([-kt,0],[L*Jm+L*J, Jm*Ra+J*Ra+L*Bm, Bm*Ra+L*B+L*k+kb*kt, B*Ra+k*Ra])

step(sys);

figure();
impulse(sys);

%%
t=0:0.1:5;
f=10;
w=2*pi*f;
s = sin(w); plot(s)