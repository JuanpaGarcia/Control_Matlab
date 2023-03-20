
function MasaResorte_ODE_plot(tspan, x0, Pd)
global A B C K
%param
k=0.5;  b=1; M=1;
%matrices del sistema 
A = [0,1;-k/M -b/M];
B = [0;1/M];
C = eye(2);

Mc = [B A*B];
H = (A-Pd(1)*eye(2))*(A-Pd(2)*eye(2))
K = -[0 1]*Mc^-1*H;

[t, X] = ode45(@MasaResorte_ODE_sys, tspan, x0);

%graficar 
figure;
subplot(2,1,1); plot(t, X(:,1)); title('ESTADO 1'); grid on;
subplot(2,1,2); plot(t, X(:,2)); title('ESTADO 2'); grid on;

%graficar el control
figure;
U = K*X';
plot(t, U); title('Control Signal'); grid on;
end

function dX = MasaResorte_ODE_sys(t, X)
global A B C K
 %U = K*X;
 U = K*X +1;
 %U = 1;

dX = A*X + B*U;
end