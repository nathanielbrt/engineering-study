% Trabalho 6 - Nathaniel Sousa Barreto - 12311EMT005
% Sistema massa-mola amortecido
%
% m: Massa do sistema  /  k: Constante elástica da mola
% xo: Posição inicial  /  vo: Velocidade inicial
% t: Tempo inicial  /  tfinal: Tempo final  /  inc: Incremento de tempo
% wn: Frequência angular
% n: Número de pontos para o gráfico

clc
clear all
clear global

d = 5;
m =900+d;
k =(2.99*10^4)+d;
xo =0.3+(d/5);
vo = 0.5+(d/5);
wn = sqrt(k/m);

b = input('Defina o seu ξ: ');
n = input('digite o numero de pontos: ');

tfinal = 3.5;
t = 0;

inc = tfinal/n;

if b<1
  for i=1:1:n
    A = e^(-b*wn*t);
    B = (xo*cos((1-b^2)^(1/2)*wn*t));
    D = (vo+(b*wn*xo))/((1-b^2)^(1/2)*wn);
    E = sin((1-b^2)^(1/2)*wn*t);
    x(i) = A*(B+(D*E));
    tem(i) = t;
    t = t+inc;
  endfor

  plot(tem,x,'color','b')
  title('Sistema Subamortecido')
  xlabel('Tempo (s)')
  ylabel('Deslocamento (m)')

endif

if b== 1
  for i=1:1:n
    x(i) = (xo+(vo+wn*xo)*t)*e^(-wn*t);
    tem(i) = t;
    t = t+inc;
  endfor

  plot(tem,x,'color','r')
  title('Sistema Amortecido Criticamente')
  xlabel('Tempo (s)')
  ylabel('Deslocamento (m)')
endif


if b>1
  for i=1:1:n
    A = (-b+sqrt(b^2 - 1))*wn*t;
    B = (-b-sqrt(b^2-1))*wn*t;
    C1 = (xo*wn*(b+sqrt(b^2-1))+vo)/(2*wn*sqrt(b^2-1));
    C2 = (-xo*wn*(b-sqrt(b^2-1))-vo)/(2*wn*sqrt(b^2-1));
    x(i) = C1*exp(A)+C2*exp(B);
    tem(i) = t;
    t = t+inc;
  endfor

  plot(tem,x,'color','g')
  title('Sistema Superamortecido')
  xlabel('Tempo (s)')
  ylabel('Deslocamento (m)')
  endif
