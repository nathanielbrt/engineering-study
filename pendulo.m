% Nathaniel Sousa Barreto - 12311EMT005
% Trabalho 5 - Movimento de um pendulo - 28/02/2024
%
% ang: angulo em graus / theta: angulo em radianos
% n: numero de pontos / inc: incremento do angulo
% x: posição horizontal / y: posição vertical

clc
clear all
clear global

d = 5;
L = 4.5*d + 7;
ang = 0;
n= input('digite o numero de pontos: ')
inc = 65/n;

for i=1:1:n

  theta = deg2rad(ang);
  x = L*sin(theta);
  y = L-(L*cos(theta));
  A(i, 1) = theta;
  A(i, 2) = x;
  A(i, 3) = y;
  ang = ang + inc;

endfor

figure(1)
plot(A(:, 2), A(:, 3));
xlabel('posicao horizontal (cm)');
ylabel('posicao vertical (cm)');
title('movimento do pendulo');

figure(2)
subplot(1, 2, 1);
plot(A(:, 2), A(:, 1));
xlabel('posicao horizontal (cm)');
ylabel('angulo (rad)');
title('angulo x posicao');

subplot(1, 2, 2);
plot(A(:, 3), A(:, 1));
xlabel('posicao vertical (cm)');
ylabel('angulo (rad)');
title('angulo x posicao');





