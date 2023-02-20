M1=1; M2=1; K=1; B=1;
%a = [M2,0,K]
sys = tf([-M2,0,-K],[M1*M2,B*M2,K*M1+K*M2,B*K,0])
step(sys)
