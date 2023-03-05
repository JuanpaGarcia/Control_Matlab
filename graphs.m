%%
%importar datos de un txt, obtenido de terminal serial
a = importdata('motor_10_v_sin_3hz.txt');
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

