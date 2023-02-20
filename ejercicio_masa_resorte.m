clear all;
clc;

 M=1;b=1;k=1;sys=tf([1],[M,b,k]);
 step(sys)   % Se asumeunaentrada escalónde 1 N
 
 %%
  M=1;b=1;k=1;sys=tf([1],[M,b,k]);