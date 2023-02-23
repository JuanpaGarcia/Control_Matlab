function Pinon_Cremallera(tspan, x0)

global A B

% Parámetros del sistema

L=1E-3; R=10; J=0.001; B=0.2; k_t=1; k_b=1; n=10;
N=30; M=5; b=0.8; k=0.5;


% Matrices
dospienecuadrada = (2*pi*N)^2;
denominador = (J*(dospienecuadrada)+(n^2)*M);
A = [0, 0, n/(2*pi*N); 0, -R/L, -k_b/L; -(n*k*2*pi*N)/denominador, (k_t*dospienecuadrada)/denominador, -((B*dospienecuadrada)+((n^2)*b))/denominador];
B = [0; 1/L; 0];
C = [2, 0, -(3*n)/(2*pi*N); 0, 1, 0];
D = [0 0.3];
poleA = eig(A) % Polos


[t, X] = ode45(@Pinon_Cremallera_sys, tspan, x0);

%Gráficas
figure;
subplot(3, 1, 1); plot(t, X(:,1),'m'); title('Estado 1'); grid;
subplot(3, 1, 2); plot(t, X(:,2), 'c'); title('Estado 2'); grid;
subplot(3, 1, 3); plot(t, X(:,3), 'g'); title('Estado 3'); grid;

%Salida
figure;
plot(t,X*C'); title('Salida'); grid;

end 

function dX = Pinon_Cremallera_sys(t, X)

global A B

% U = 0;
U = 2;
% U = 2*sin(t);

dX = A*X + B*U;

end