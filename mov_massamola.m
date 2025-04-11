

clc
clear all
clear global

d = 5;
m = d + 0.5;
k = 700*d;
x0 = 0.02*d;
v0 = 0.01*d;
t = 0;

n = input('quantos pontos: ');

w = sqrt(k/m);
T = 2*pi/w;
inc = T/n;

for i=1:1:n
  x = x0*cos(w*t) + (v0/w)*sin(w*t);
  v = -x0*sin(w*t)*w + (v0/w)*cos(w*t)*w;
  a = -x0*cos(w*t)*(w^2) - (v0/w)*sin(w*t)*w^2;

  A(i, 1) = t;
  A(i, 2) = x;
  A(i, 3) = v;
  A(i, 4) = a;

  t = t + inc;
endfor

subplot(1, 3, 1)
plot(A(:, 1), A(:, 2));
xlabel('tempo(s)');
ylabel('posicao vertical (m)');
title('movimento do sistema mass-mola');

subplot(1, 3, 2)
plot(A(:, 1), A(:, 3));
xlabel('tempo(s)');
ylabel('velocidade(m/s)');
title('velocidade(m/s) x tempo (s)');

subplot(1, 3, 3)
plot(A(:, 1), A(:, 4));
xlabel('tempo(s)');
ylabel('aceleracao(m/s^2)');
title('aceleracao(m/s^2) x tempo(s)');
