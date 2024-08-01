clear all;
clc;
display('------------Linear Quadratic Regulator-----------------')
mc= 1.5;
mp = 0.5;
g = 9.78;
L=1;
d1= 1e-2;
d2= 1e-2;
A= [0, 0, 1, 0;
    0, 0, 0, 1;
    0, (g*mp)/mc, -d1/mc, -d2/(L*mc);
    0, g*(mc+mp)/(L*mc), -d1/(L*mc), -(d2*mc+d2*mp)/(L^2*mp*mc)];
B= [0;
    0;
    1/mc;
    1/(L*mc)];
C= [0  1  0  0];
D=0;
system=ss(A,B,C,D);
sys1=tf(system)
QQ=eye(4);
Q=QQ;
R=0.1;
x0=[0;5*pi/180; 0; 0];
des_pole=[-3;-3;-3;-3]*1;
K_1=acker(A,B,des_pole);
K= lqr(A,B,Q,R);
% Closed loop system
sys = ss((A - B*K), B, C, D);
subplot(2,1,1)
step(sys)
n=length(K);
AA=A - B * K
%for i=1:n
%    BB(:,i)=B * K(i);
%end
BB=B*K;
%display(BB)
CC=C
DD=D
sos=ss(AA,BB,CC,DD);
%for i=1:n
 %    sys(:,i)=ss(AA,BB(:,i),CC,DD);
%end
subplot(2,1,2)
step(sos)
%subplot(3,1,3)
%step(sys(:,2))
% Run response to initial condition
