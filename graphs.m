%%
%importar datos de un txt, obtenido de terminal serial
a = importdata('motor_10v.txt');
v = a;
min = a(1,2);
for i=1 : length(a)
    v(i,2) = (a(i,2) - min)*(1E-6);
end
%%
%acotar los datos
x = v(:,1);
y = v(:,2);
%%
%convertir fa a velocidad angular
ppr = 48;
convert = (2*pi)/(ppr);

new_x = zeros(length(x));

for i=1 : length(x)
    new_x(i) = ( 1/(x(i) *convert) );
end
%%
plot(y,new_x);

%%
%FDT

churrito = -50;
wn = -802;
k = 0.11;

sys = tf([k*wn^2],[1,2*churrito*wn, wn^2])

t = (0:0.01:1)';
y = sin(2*pi*10*t)+1;
%plot(t,y)

lsim(sys, y, t);