% Trabalho 9 - Nathaniel Sousa Barreto - 12311EMT005
% Transferência de calor em uma parede fina - 04/04/2024
%
% Equação - T(i) = ((T2 - T1) / L) * x + T1;
% L - comprimento;
% T1 - temperatura 1  /   T2 - Temperatura 2;
%
% Respostas:
% alternativa c) 162.1437
% alternativa d) 93.1336
% alternativa e) 8.1106
% alternativa f) 66.25 está entre 64.850 e 66.500


clc
clear all
clear global

d = 3;
L = 5*d + 70;
T1 = ((d)^2) + 190;
T2 = 10*d;
n= input('Digite a quantidade de pontos: ');
inc = L / n;
x = 0;
x2 = 0;
c = 2 * L / 7;
D = T2 + (d / 2);
e = T1 - 2 * d;
F = ((T1 + T2) / 4);
disp(' ');

disp(['Selecione  no grafico no valor da posição ', num2str(c)]);
disp(['Selecione no grafico no valor de temperatura ', num2str(D)]);
disp(['Selecione no grafico no valor de temperatura ', num2str(e)]);

for i = 1:1:n
    T(i) = ((T2 - T1) / L) * x + T1;
    X(i) = x;
    x = x + inc;
end

for o = 1:1:100
    R(o) = ((T2 - T1) / L) * x2 + T1;
    x2 = x2 + (L / 100);
end

o = 1;
while o <= 100
    if R(o) <= ((T1 + T2) / 4) + inc && R(o) >= ((T1 + T2) / 4)
        Q1 = R(o);
        Q2 = R(o + 1);
        break;
    end
    o = o + 1;
end


plot(X, T)
title('Temperatura x Comprimento')
ylabel('Temperatura (°C)')
xlabel('Comprimento (cm)')
[xs, ys] = ginput(3);
grid on

disp(' ');
disp('Resposta da alternativa c:');
disp(['O valor da temperatura na posição ', num2str(c), ' é de: ', num2str(ys(1))]);
disp(' ');
disp('Resposta da alternativa d:');
disp(['O valor da posição na temperatura ', num2str(D), ' é de: ', num2str(xs(2))]);
disp(' ');
disp('Resposta da alternativa e:');
disp(['O valor da posição na temperatura ', num2str(e), ' é de: ', num2str(xs(3))]);
disp(' ');
disp('Resposta da alternativa f:');
disp(['O valor de ', num2str(F), ' está entre os valores ', num2str(Q2), ' e ', num2str(Q1)]);





