% Nathaniel Sousa Barreto - 12311EMT005
% Lançamento obliquo
%
% n - numero de pontos
% k - contador
% v0 - velociade inicial / v0x - v. inicial horizontal
% v0y - v. inicial vertical / v - velociade
% a - angulo de lançamento / g - gravidade
% x - alcance / y - altura
% t0 - tempo inicial / t_total - tempo total
% inc - incremento

clc
clear all
clear global

n = input('numero de pontos: ');
k = n + 1;
d = 5;
v0 = 2*d + 1.5;
a = 5*d + 1.3;
g = 9.81;
y0 = 1.5*d + 1.9;
v0x = v0 * cosd(a);
v0y = v0 * sind(a);
t0 = 0;
t_total = (v0y + sqrt(v0y^2 + 2*g*y0)) / g;
inc = t_total / n;

for i=1:1:k
  x = v0x*t0;
  y = y0 + v0y*t0 - (g*t0^2)/2;
  vy = v0y - g*t0;
  v = sqrt(v0x^2 + vy^2);
  A(i, 1) = x;
  A(i, 2) = y;
  A(i, 3) = v;
  A(i, 4) = t0;
  t0 = t0 + inc;
endfor

figure(1)

subplot(2, 2, 1)
plot(A(:, 4), A(:, 3));
xlabel('tempo (s)');
ylabel('velocidade (m/s)');
title('velocidade pelo tempo');
grid on

subplot(2, 2, 2)
plot(A(:, 4), A(:, 1));
xlabel('tempo (s)');
ylabel('alcance (m)');
title('alcance pelo tempo');
grid on

subplot(2, 2, 3)
plot(A(:, 4), A(:, 2));
xlabel('tempo (s)');
ylabel('altura (m)');
title('altura pelo tempo');
grid on

subplot(2, 2, 4)
plot(A(:, 1), A(:, 2));
xlabel('alcance (m)');
ylabel('altura (m)');
title('altura pelo alcance');
grid on
