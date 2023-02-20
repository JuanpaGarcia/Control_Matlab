clc 
close all 

k=1; J=1; L=1; B=1; R=1;

sys = tf([k],[J*L, L*B*R*J, B*R+k^2]);

step(sys);
