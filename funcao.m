% Trabalho 8 - Nathaniel Sousa Barreto - 12311EMT005
%
% Gráfico de uma função
% Máximo: 1
% Mínimo: -23
% Período: 30
%
% A - matriz com os valores de x e y da função
% Equação - y = exp(0.2*x)*(cos(x/5)-sin(x/5))
% n - número de pontos

clc
clear all
clear global

n = input("numero de pontos :");
x = 0;
inc = (6*pi)/n;

for i=1:1:n
y = exp(0.2*x)*(cos(x/5)-sin(x/5));

A(i, 1) = x;
A(i, 2) = y;

x = x + inc;
endfor

plot( A(:, 1), A(:, 2));
xlabel('eixo x');
ylabel('eixo y');

[xv, yv] = ginput(2);
maximox = xv(1);
maximoy = yv(1);
minimox = xv(2);
minimoy = yv(2);
periodo = 2*(maximox - minimox);

disp([maximoy]);
disp([minimoy]);
disp([periodo]);
