function MasaResorte_PID(tspan, x0,K)
 global A B C Kp Ki Kd N
 %define controller gains
 Kp = K(1);
 Ki = K(2);
 Kd = K(3);
 N = 1000;
 
 %parameters and sys matrix
 M=1;b=1;k=0.5;
 A = [0;1;-k/M;-b/M];
 B = [0;1/M];
 C = [1,0];
 [t,X] = ode45(@MasaResorte_PID_sys, tspan, [x0 0 0]);
 ref = 1;
 X_sys = X(:, 1:2);
 X_PID = X(:, 3:4);
 %grafico salida y ref
 plot(t, 0*t+ref, 'r', t X_sys*C', 'k'); title('SALIDA Y REF');
 %grafica de entrada de contol
 figure:
 e = ref - X_sys*C';
 U = X_PID*[N*Ki, Ki-Kd*N^2]' + e*(Kp+N*Kd);
 plot(t, U); title('Entrada de control');
 
end

function dX = MasaResorte_PID_sys(t, X)
 global A B C Kp Ki Kd N
 X_sys = X(:, 1:2);
 X_PID = X(:, 3:4);
 ref =1;
 e = ref - C*X_sys;
 U = [N*Ki, Ki-Kd*N^2]*X_PID + e*(Kp+N*Kd);
 %ode
 dX_sys = A*X_sys + B*U;
 dX_PID = [0,1;0,-N]*X_PID + [0;1]*e;
 dX = [dX_sys;dX_PID];
end