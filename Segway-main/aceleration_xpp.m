function qpp= aceleration_xpp( ent )
%Par�metros del sistema
m = 1.5;
g = 9.78;
I = 1;
lc = 2;
%fv = 0.5;
%Elementos de entrada
qp = (ent(1,1));
tau = (ent(2,1));
q = (ent(3,1));
%ecuaci�n modelo din�mico
qpp = ( tau - m * g * lc * sin( q ) ) * ( 1 / (m*lc*lc+I) ) 

