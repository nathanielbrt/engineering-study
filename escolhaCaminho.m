% Trabalho Final - Nathaniel Sousa Barreto - 12311EMT005
%
% Sistema de escolha do melhor caminho entre dois pontos
%
% As variaveis que nao estiverem descritas mas seguem o mesmo padrao das descritas abaixo
% tem a mesma funcao, mudando apenas o trajeto ao qual se aplicam
%
% S1: Restrição 1 do semáforo.
% VM1: Restrição 1 da velocidade máxima.
% IT1(D): Função da restrição 1 de intensidade do tráfego em relação à distância D.
% e: Matriz que guarda todos os dados de restrição e distâncias.
% ab1: Variável para auxiliar na soma dos tempos do caminho 1 do ponto A ao B.
% AB1: Variável que guarda o valor da soma dos tempos do caminho 1 do ponto A ao B.
% AB: Vetor para guardar todos os tempos possíveis de A a B.
% mAB: Valor do tempo mais curto do percurso do ponto A ao B.
% iab: Índice que identifica o local onde o tempo mínimo está no vetor.
% dab1: Variável que guarda o valor da soma das distâncias do caminho 1 do ponto A ao B.
% DAB: Vetor para guardar todas as distâncias possíveis de A a B.
% dab: Valor da distância que corresponde ao tempo mais curto do percurso do ponto A ao B.
% vab1: Variável que guarda o valor da soma dos tempos do caminho 1 do ponto A ao B se existisse somente a velocidade máxima.
% VAB: Vetor para guardar todos os tempos possíveis de A a B se existisse somente a velocidade máxima.
% mvab: Valor do tempo que corresponde ao tempo mais curto do percurso do ponto A ao B se existisse somente a velocidade máxima.
% Vab(z): Vetor que guarda o valor da velocidade de A a B.
% tbc(z):Vetor que guarda os valores de t de A a B

clc
clear all
clear global

fprintf('Programa que escolhe o melhor caminho entre dois pontos\n')
fprintf('\n')
n = input('Digite o numero de caminho: ');
fprintf('\n')

%Semaforo
S1=15;
S2=20;
S3=30;

%Velocidade maxima
VM1= 40/3.6;
VM2= 50/3.6;
VM3= 60/3.6;

%Intensidade de transito
function i1=IT1(D);
  i1=D/100*10;
endfunction

function i2=IT2(D);
  i2=D/100*50;
endfunction

function i3=IT3(D);
 i3=D/100*240;
endfunction

%Restrições
e=[
1, S1, IT1(100), VM1, 100;
2, S2, IT1(100), VM1, 100;
3, S3, IT1(120), VM1, 120;
4, S3, IT1(100), VM1, 100;
5, S1, IT1(120), VM1, 120;
6, S2, IT1(100), VM1, 100;
7, S2, IT1(100), VM1, 100;
8, S3, IT1(100), VM1, 100;
9, S1, IT1(120), VM1, 120;
10, S1, IT1(140), VM2, 140;
11, S2, IT1(140), VM2, 140;
12, S3, IT1(135), VM2, 135;
13, S3, IT1(140), VM2, 140;
14, S1, IT1(135), VM2, 135;
15, S2, IT1(140), VM2, 140;
16, S2, IT1(140), VM2, 140;
17, S3, IT1(140), VM2, 140;
18, S1, IT1(135), VM2, 135;
19, S1, IT1(130), VM3, 130;
20, S2, IT1(130), VM3, 130;
21, S3, IT1(130), VM3, 130;
22, S3, IT1(130), VM3, 130;
23, S1, IT1(130), VM3, 130;
24, S2, IT1(130), VM3, 130;
25, S2, IT1(130), VM3, 130;
26, S3, IT1(130), VM3, 130;
27, S1, IT1(130), VM3, 130;
28, S1, IT2(125), VM1, 125;
29, S2, IT2(125), VM1, 125;
30, S3, IT2(125), VM1, 125;
31, S3, IT2(125), VM1, 125;
32, S1, IT2(125), VM1, 125;
33, S2, IT2(125), VM1, 125;
34, S2, IT2(125), VM1, 125;
35, S3, IT2(125), VM1, 125;
36, S1, IT2(125), VM1, 125;
37, S1, IT2(155), VM2, 155;
38, S2, IT2(155), VM2, 155;
39, S3, IT2(200), VM2, 200;
40, S3, IT2(155), VM2, 155;
41, S1, IT2(200), VM2, 200;
42, S2, IT2(155), VM2, 155;
43, S2, IT2(155), VM2, 155;
44, S3, IT2(155), VM2, 155;
45, S1, IT2(200), VM2, 200;
46, S1, IT2(100), VM3, 100;
47, S2, IT2(100), VM3, 100;
48, S3, IT2(100), VM3, 100;
49, S3, IT2(100), VM3, 100;
50, S1, IT2(100), VM3, 100;
51, S2, IT2(100), VM3, 100;
52, S2, IT2(100), VM3, 100;
53, S3, IT2(100), VM3, 100;
54, S1, IT2(100), VM3, 100;
55, S1, IT3(115), VM1, 115;
56, S2, IT3(115), VM1, 115;
57, S3, IT3(155), VM1, 155;
58, S3, IT3(115), VM1, 115;
59, S1, IT3(155), VM1, 155;
60, S2, IT3(115), VM1, 115;
61, S2, IT3(115), VM1, 115;
62, S3, IT3(115), VM1, 115;
63, S1, IT3(155), VM1, 155;
64, S1, IT3(200), VM2, 200;
65, S2, IT3(200), VM2, 200;
66, S3, IT3(200), VM2, 200;
67, S3, IT3(200), VM2, 200;
68, S1, IT3(200), VM2, 200;
69, S2, IT3(200), VM2, 200;
70, S2, IT3(200), VM2, 200;
71, S3, IT3(200), VM2, 200;
72, S1, IT3(200), VM2, 200;
73, S1, IT3(100), VM3, 100;
74, S2, IT3(100), VM3, 100;
75, S3, IT3(100), VM3, 100;
76, S3, IT3(100), VM3, 100;
77, S1, IT3(100), VM3, 100;
78, S2, IT3(100), VM3, 100;
79, S2, IT3(100), VM3, 100;
80, S3, IT3(100), VM3, 100;
81, S1, IT3(100), VM3, 100;
82, S1, IT2(145), VM1, 145;
83, S3, IT3(145), VM3, 145;
84, S2, IT1(160), VM3, 160;
85, S2, IT1(145), VM3, 145;
86, S1, IT2(160), VM1, 160;
87, S3, IT3(145), VM3, 145;
88, S3, IT3(145), VM3, 145;
89, S2, IT1(145), VM3, 145;
90, S1, IT2(160), VM1, 160;
91, S2, IT3(155), VM1, 155;
92, S3, IT2(200), VM1, 200;
93, S2, IT1(200), VM3, 200;
94, S2, IT1(200), VM3, 200;
95, S2, IT3(200), VM1, 200;
96, S3, IT2(155), VM1, 155;
97, S3, IT2(155), VM1, 155;
98, S2, IT1(200), VM3, 200;
99, S2, IT3(200), VM1, 200;
100, S3, IT3(200), VM2, 200;
101, S1, IT1(135), VM3, 135;
102, S2, IT2(135), VM1, 135;
103, S2, IT2(135), VM1, 135;
104, S3, IT3(135), VM2, 135;
105, S1, IT1(200), VM3, 200;
106, S1, IT1(200), VM3, 200;
107, S2, IT2(135), VM1, 135;
108, S3, IT3(135), VM2, 135];

%Calculando o tempo gasto para percorrer a distancia com a velocidade maxima
nova_coluna = e(:,5)./e(:,4);

%Guardar valor desse tempo
e=[e,nova_coluna];

%Calculo de tempo
ab1 = sum(e(1:9, [2, 3, 6]));
AB1= sum(ab1);
ab2 = sum(e(10:18, [2, 3, 6]));
AB2= sum(ab2);
ab3 = sum(e(19:27, [2, 3,  6]));
AB3= sum(ab3);
bc1 = sum(e(28:36, [2, 3,  6]));
BC1= sum(bc1);
bc2 = sum(e(37:45, [2, 3,  6]));
BC2 = sum(bc2);
bc3 = sum(e(46:54, [2, 3,  6]));
BC3 = sum(bc3);
cd1 = sum(e(55:63, [2, 3,  6]));
CD1= sum(cd1);
cd2 = sum(e(64:72, [2, 3,  6]));
CD2= sum(cd2);
cd3 = sum(e(73:81, [2, 3,  6]));
CD3= sum(cd3);
de1 = sum(e(82:90, [2, 3,  6]));
DE1= sum(de1);
de2 = sum(e(91:99, [2, 3, 6]));
DE2= sum(de2);
de3 = sum(e(100:108, [2, 3, 6]));
DE3= sum(de3);

%Conversão de unidades
AB=[AB1,AB2,AB3]/60;
BC=[BC1,BC2,BC3]/60;
CD=[CD1,CD2,CD3]/60;
DE=[DE1,DE2,DE3]/60;

%Calculo de tempo (Escolhendo o tempo minimo e indice)
%Calculo de tempo para todas as possibilidades
[mAB,iab]= min(AB);
[mBC, ibc]= min(BC);
[mCD, icd]= min(CD);
[mDE, ide]= min(DE);
mAC= mAB+mBC;
mAD= mAC+mCD;
mAE= mAD+mDE;
mBD= mBC+mCD;
mBE= mBD+mDE;
mCE=mCD+mDE;

%Calculo da distancias(Soma dos valores das matrizes)
dab1= sum(e(1:9, 5));
dab2= sum(e(10:18, 5));
dab3= sum(e(19:27, 5));
dbc1= sum(e(28:36, 5));
dbc2= sum(e(37:45, 5));
dbc3= sum(e(46:54, 5));
dcd1= sum(e(55:63, 5));
dcd2= sum(e(64:72, 5));
dcd3= sum(e(73:81, 5));
dde1= sum(e(82:90, 5));
dde2= sum(e(91:98, 5));
dde3= sum(e(99:108, 5));

%Calculo da distancias% (Colocando os valores em uma matriz)
DAB=[dab1,dab2,dab3];
DBC=[dbc1,dbc2,dbc3];
DCD=[dcd1,dcd2,dcd3];
DDE=[dde1,dde2,dde3];

%Calculo da distancias% (Colocando a distancia do menor tempo)
mdab=DAB(iab);
mdbc=DBC(ibc);
mdcd=DCD(icd);
mdde=DDE(ide);

%Calculo da distancias(Calculo de distancia para todas as possibilidades)
dab=mdab;
dac=dab+mdbc;
dad=dac+mdcd;
dae=dad+mdde;
dbc=mdbc;
dbd=dbc+mdcd;
dbe=dbd+mdde;
dcd=mdcd;
dce=dcd+mdde;
dde=mdde;

%Calculando o tempo se fosse apenas a velocidade maxima
vab1= sum(e(1:9, 6));
vab2= sum(e(10:18, 6));
vab3= sum(e(19:27, 6));
vbc1= sum(e(28:36, 6));
vbc2= sum(e(37:45, 6));
vbc3= sum(e(46:54, 6));
vcd1= sum(e(55:63, 6));
vcd2= sum(e(64:72, 6));
vcd3= sum(e(73:81, 6));
vde1= sum(e(82:90, 6));
vde2= sum(e(91:98, 6));
vde3= sum(e(99:108, 6));

%Calculando o tempo se fosse apenas a velocidade maxima (Transformando em minutos)
VAB=[vab1,vab2,vab3]/60;
VBC=[vbc1,vbc2,vbc3]/60;
VCD=[vcd1,vcd2,vcd3]/60;
VDE=[vde1,vde2,vde3]/60;

%Calculando o tempo se fosse apenas a velocidade maxima(Calculo para todas as possibilidades)
mvab=VAB(iab);
mvbc=VBC(ibc);
mvcd=VCD(icd);
mvde=VDE(ide);
mvac=mvab+mvbc;
mvad=mvac+mvcd;
mvae=mvad+mvde;
mvbd=mvbc+mvcd;
mvbe=mvbd+mvde;
mvce=mvcd+mvde;

%Calculando vetores para plotagem de gráficos
  for z=1:1:(mAB*60)

    Vab(z)=dab/(mAB*60);
    endfor
   for z=1:1:(mBC*60)

    Vbc(z)=dbc/(mBC*60);
  endfor
   for z=1:1:(mCD*60)

    Vcd(z)=dcd/(mCD*60);
  endfor
    for z=1:1:(mDE*60)

    Vde(z)=dde/(mDE*60);
  endfor

  Vac=[Vab,Vbc];
  Vad=[Vac,Vcd];
  Vae=[Vad,Vde];

  Vbd=[Vbc,Vcd];
  Vbe=[Vbd,Vde];
  Vce=[Vcd,Vde];

PI = zeros(1, 11);

for I=1:1:n
  PI = zeros(1, I);
PI(I) = input('Digite o ponto inicial: ', 's');


    if PI(I) == 'E' || PI(I) == 'e'
        fprintf('O ponto E não pode ser ponto inicial \n')
        if I ~= n
        fprintf('Digite novamente:\n')
        fprintf('\n')
        endif
    else
        while true
            PF(I) = input('Digite o ponto final: ', 's');
            fprintf('\n')
            if PI(I) ~= 'E' && PI(I) ~= 'e'
                break;
                end
            end
  if PF(I) == 'A' || PF(I) == 'a'
    fprintf('O ponto A não pode ser ponto final \n')
     if I ~= n
        fprintf('Digite novamente.\n')
             fprintf('\n')
        endif

  endif

 % Do ponto A ao B
if( PI(I) == 'A' || PI(I)== 'a') &&( PF(I) == 'B' || PF(I) == 'b')
  fprintf('O melhor caminho de A ate B leva %.2f minutos e tem %.2f metros de comprimento\n',mAB,dab)
  fprintf('O caminho seria AB%d(%.2f min)\n',iab,mAB)
  fprintf('Com Velocidade máxima voce gastaria %.2f minutos\n',mvab)
        fprintf('\n')

  for z=1:1:(mAB*60)
    tab(z)=z;

  endfor

  figure(I)
  plot(tab,Vab,'-b')
  title('Velocidade x tempo A-B')
  xlabel('Tempo (s)')
  ylabel('Velocidade (m/s)')
endif

% Do ponto A ao C
if (PI(I) == 'A' || PI(I)== 'a') && (PF(I) == 'C' || PF(I) == 'c')
  fprintf('O melhor caminho de A ate C leva %.2f minutos e tem %.2f metros de comprimento\n',mAC,dac)
   fprintf('O caminho seria AB%d(%.2f min) BC%d(%.2f min)\n',iab,mAB,ibc,mBC)
    fprintf('Com Velocidade máxima voce gastaria %.2f min\n',mvac)
    fprintf('\n')

  for z=1:1:(mAC*60)
    tac(z)=z;


  endfor

   figure(I)
  plot(tac,Vac,'-b')
  title('Velocidade x tempo A-C')
  xlabel('Tempo (s)')
  ylabel('Velocidade (m/s)')
endif

% Do ponto A ao D
if (PI(I) == 'A' || PI(I)== 'a') && (PF(I) == 'D' || PF(I) == 'd')
  fprintf('O melhor caminho de A ate D leva %.2f minutos e tem %.2f metros de comprimento\n',mAD,dad)
   fprintf('O caminho seria AB%d(%.2f min) BC%d(%.2f min) CD%d(%.2f min)\n',iab,mAB,ibc,mBC,icd,mCD)
    fprintf('Com Velocidade máxima voce gastaria %.2f min\n',mvad)
          fprintf('\n')

     for z=1:1:(mAD*60)
    tad(z)=z;

  endfor

   figure(I)
  plot(tad,Vad,'-b')
  title('Velocidade x tempo A-D')
  xlabel('Tempo (s)')
  ylabel('Velocidade (m/s)')
endif

% Do ponto A ao E
if (PI(I) == 'A' || PI(I)== 'a') && (PF(I) == 'E' || PF(I) == 'e')
  fprintf('O melhor caminho de A ate E leva %.2f minutos e tem %.2f metros de comprimento\n',mAE,dae)
    fprintf('O caminho seria AB%d(%.2f min) BC%d(%.2f min) CD%d(%.2f min) DE%d(%.2f min )\n',iab,mAB,ibc,mBC,icd,mCD,ide,mDE)
    fprintf('Com Velocidade máxima voce gastaria %.2f minutos\n',mvae)
          fprintf('\n')

     for z=1:1:(mAE*60)
    tae(z)=z;

  endfor

   figure(I)
  plot(tae,Vae,'-b')
  title('Velocidade x tempo A-E')
  xlabel('Tempo (s)')
  ylabel('Velocidade (m/s)')
endif

% Do ponto B ao C
if( PI(I) == 'B' || PI(I)== 'b') &&( PF(I) == 'C' || PF(I) == 'c')
    fprintf('O melhor caminho de B ate C leva %.2f minutos e tem %.2f metros de comprimento\n',mBC,dbc)
  fprintf('O caminho seria BC%d(%.2f min) \n',ibc,mBC)
  fprintf('Com Velocidade máxima voce gastaria %.2f min\n',mvbc)
  fprintf('\n')

  for z=1:1:(mBC*60)
    tbc(z)=z;

  endfor

    figure(I)
  plot(tbc,Vbc,'-b')
  title('Velocidade x tempo B-C')
  xlabel('Tempo (s)')
  ylabel('Velocidade (m/s)')
endif

% Do ponto B ao D
if( PI(I) == 'B' || PI(I)== 'b') &&( PF(I) == 'D' || PF(I) == 'd')
    fprintf('O melhor caminho de B ate D leva %.2f minutos e tem %.2f metros de comprimento\n',mBD,dbd)
  fprintf('O caminho seria BC%d(%.2f min)  CD%d(%.2f min)\n',ibc,mBC,icd,mCD)
  fprintf('Com Velocidade máxima voce gastaria %.2f min\n',mvbd)
  fprintf('\n')

  for z=1:1:(mBD*60)
    tbd(z)=z;

  endfor

   figure(I)
 plot(tbd,Vbd,'-b')
  title('Velocidade x tempo B-D')
  xlabel('Tempo (s)')
  ylabel('Velocidade (m/s)')
endif

% Do ponto B ao E
if( PI(I) == 'B' || PI(I)== 'b') &&( PF(I) == 'E' || PF(I) == 'e')
  fprintf('O melhor caminho de B ate E leva %.2f minutos e tem %.2f metros de comprimento\n',mBE,dbe)
  fprintf('O caminho seria BC%d(%.2f min)  CD%d(%.2f min) DE%d(%.2f min) \n',ibc,mBC,icd,mCD ,ide,mDE)
  fprintf('Com Velocidade máxima voce gastaria %.2f min\n',mvbe)
  fprintf('\n')

  for z=1:1:(mBE*60)
    tbe(z)=z;

  endfor

    figure(I)
  plot(tbe,Vbe,'-b')
  title('Velocidade x tempo B-E')
  xlabel('Tempo (s)')
  ylabel('Velocidade (m/s)')
endif

% Do ponto C ao D
if( PI(I) == 'C' || PI(I)== 'c') &&( PF(I) == 'D' || PF(I) == 'd')
 fprintf('O melhor caminho de C ate D leva %.2f minutos e tem %.2f metros de comprimento\n',mCD,dcd)
  fprintf('O caminho seria CD%d(%.2f min)  \n',icd,mCD )
  fprintf('Com Velocidade máxima voce gastaria %.2f min\n',mvcd)
  fprintf('\n')

  for z=1:1:(mCD*60)
    tcd(z)=z;

  endfor

    figure(I)
  plot(tcd,Vcd,'-b')
  title('Velocidade x tempo C-D')
  xlabel('Tempo (s)')
  ylabel('Velocidade (m/s)')
endif

% Do ponto C ao E
 if( PI(I) == 'C' || PI(I)== 'c') &&( PF(I) == 'E' || PF(I) == 'e')
   fprintf('O melhor caminho de C ate E leva %.2f minutos e tem %.2f metros de comprimento\n',mCE,dce)
  fprintf('O caminho seria CD%d(%.2f min) DE%d(%.2f min) \n',icd,mCD ,ide,mDE)
  fprintf('Com Velocidade máxima voce gastaria %.2f min\n',mvce)
  fprintf('\n')

  for z=1:1:(mCE*60)
    tce(z)=z;

  endfor
    figure(I)
  plot(tce,Vce,'-b')
  title('Velocidade x tempo C-E')
  xlabel('Tempo (s)')
  ylabel('Velocidade (m/s)')
endif

% Do ponto D ao E
if( PI(I) == 'D' || PI(I)== 'd') &&( PF(I) == 'E' || PF(I) == 'e')
    fprintf('O melhor caminho de D ate E leva %.2f minutos e tem %.2f metros de comprimento\n',mDE,dde)
  fprintf('O caminho seria DE%d(%.2f min) \n',ide,mDE)
  fprintf('Com Velocidade máxima voce gastaria %.2f min\n',mvde)
  fprintf('\n')

  for z=1:1:(mDE*60)
    tde(z)=z;

  endfor
    figure(I)
  plot(tde,Vde,'-b')
  title('Velocidade x tempo D-E')
  xlabel('Tempo (s)')
  ylabel('Velocidade (m/s)')
endif


%Casos Impossiveis
if( PI(I) == 'B' || PI(I)== 'b') &&(PF(I) == 'B' || PF(I) == 'b' )
fprintf('O caminho é impossivel\n')
 fprintf('\n')
   if I ~= n
     fprintf('Digite novamente.\n')
      fprintf('\n')
     endif
endif
if( PI(I) == 'C' || PI(I)== 'c') &&(PF(I) == 'B' || PF(I) == 'b' || PF(I) == 'C' || PF(I)== 'c')
fprintf('O caminho é impossivel\n')
 fprintf('\n')
   if I ~= n
     fprintf('Digite novamente.\n')
      fprintf('\n')
     endif

endif
if( PI(I) == 'D' || PI(I)== 'd') &&( PF(I) == 'C' || PF(I) == 'c'  || PF(I) == 'B' || PF(I) == 'b' ||  PF(I) == 'D' || PF(I)== 'd')
fprintf('O caminho é impossivel\n')
 fprintf('\n')
      if I ~= n
     fprintf('Digite novamente.\n')
      fprintf('\n')
     endif

endif
endif
endfor

fprintf('Fim do Programa')
return
