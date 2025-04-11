% Nathaniel Sousa Barreto - 12311EMT005 - 08/02/2024
% Simulação de um sistema biela-manivela
%
% OC - manivela que rotaciona em torno do ponto fixo O
% CB - biela
% O - ângulo de rotação da manivela / Orad - Ângulo em radianos
% Ox - abcissa do ponto O / Oy - ordenada do ponto O
% Brad - ângulo entre a biela e a linha de base pitão-ponto O em radianos
% Crad - ângulo entre a manivela e a biela em radianos
% a - distância e o ponto O
% Cx e Cy - abcissa e ordenada do encontro entre biela e manivela
% Bx e By - ordenada e abcissa do encontro entre biela e pistão

clc
clear all
clear global

d=5;
OC=28+d;
CB=160+d;
O=25+d;
Orad= deg2rad(O);

for i=1:1:50
Brad = asin(OC*sin(Orad)/CB);
Crad = pi-Brad-Orad;
a =sqrt(OC^2 + CB^2 - 2*OC*CB*cos(Crad));

Ox = 0;
Oy = 0;

Cx = -( OC*cos(Orad));
Cy = OC*sin(Orad);

Bx = -a;
By = 0;

A(i, 1) = Cx;
A(i, 2) = Cy;
A(i, 3) = Bx;

inc = deg2rad(15);
Orad= Orad+inc;

endfor

figure(1)

subplot(2, 2, 2)
plot([Ox A(1, 1) A(1, 3) Ox ], [Oy A(1, 2) By Oy], 'g', 'LineWidth', 2);
xlim([-200, 50]);
ylim([-100, 100]);
axis equal;
xlabel('Eixo X');
ylabel('Eixo y');
title('Sistema Biela-Manivela posicao 1:');

subplot(2, 2, 3)
plot([Ox A(2, 1) A(2, 3) Ox], [Oy A(2, 2) By Oy], 'm', 'LineWidth', 2);
xlim([-200, 50]);
ylim([-100, 100]);
axis equal;
xlabel('Eixo X');
ylabel('Eixo y');
title('Sistema Biela-Manivela posicao 2:');

subplot(2, 2, 4)
plot([Ox A(3, 1) A(3, 3) Ox], [Oy A(3, 2) By Oy], 'r', 'LineWidth', 2);
xlim([-200, 50]);
ylim([-100, 100]);
axis equal;
xlabel('Eixo X');
ylabel('Eixo y');
title('Sistema Biela-Manivela posicao 3:');

for i=1:1:50
subplot(2, 2, 1)
plot([Ox A(i, 1) A(i, 3) Ox], [Oy A(i, 2) By Oy], 'b', 'LineWidth', 2);
axis equal;
xlim([-200, 50]);
ylim([-100, 100]);
xlabel('Eixo X');
ylabel('Eixo y');
title('Sistema Biela-Manivela em movimento:');

drawnow;
pause(deg2rad(15));
endfor
