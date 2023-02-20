clc 
close all
M=0.05  ;b=1;k=1;
sys=tf([1],[M,b,k])
step(sys)