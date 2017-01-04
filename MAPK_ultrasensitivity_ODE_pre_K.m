%MAPK_ultrasensitivity_ODE_pre_K.m written 1-2-17 by JTN to simulate MAPK
%cascade, as done in Huang and Ferrell 1996

%Note that in this file, the a's, and d's have not yet been set to 1, which
%will be done to facilitate study.

function yprime = MAPK_ultrasensitivity_ODE(t,y,q)

yprime(1)	=	-a1*y(1)*[E1]+d1*y(2)+k2*y(4); %KKK
yprime(2)	=	a1*y(1)*[E1]-(d1+k1)*y(2); %KKK.E1
yprime(3)	=	-a2*y(3)*[E2]+d2*y(4)+k1*y(2)+(k3+d3)y(6) - a3*y(3)*y(5)+(k5+d5)*y(9)-a5*y(7)*y(3); %KKKP
yprime(4)	=	a2*y(3)*[E2]-(d2+k2)y(4); %KKKP.E2
yprime(5)	=	-a3*y(5)*y(3)+d3*y(6)+k4*y(8); %KK
yprime(6)	=	a3*y(5)*y(3)-(d3+k3)*y(6); %KK.KKKP
yprime(7)	=	-a4*y(7)*[KKPase]+d4*y(8)+k3*y(6)+k6*y(11)+d5*y(9)-a5*y(7)*y(3); %KKP
yprime(8)	=	a4*y(7)*[KKPase]-(d4+k4)*y(8); %KKP.KKPase
yprime(9)	=	a5*y(7)*y(3)-(d5+k5)*y(9); %KKP.KKKP
yprime(10)	=	k5y(9)-a6*y(10)*[KKPase]+d6y(11)-a7*y(10)*y(12)+(d7+k7)*y(13)+(d9+k9)*y(16)-a9*y(14)*y(10); %KKPP
yprime(11)	=	a6*y(10)*[KKPase]-(d6+k6)*y(11); %KKPP.KKPase
yprime(12)	=	-a7*y(12)*y(10)+d7*y(13)+k8*y(15); %K
yprime(13)	=	a7*y(12)*y(10)-(d7+k7)*y(13); %K.KKPP
yprime(14)	=	k7*y(13)-a8*y(14)*[KPase]+d8*y(15)-a9*y(14)*y(10)+d9*y(16)+k10*y(18); %KP
yprime(15)	=	a8*y(14)*[KPase]-(d8+k8)*y(15); %KP.KPase
yprime(16)	=	a9*y(14)*y(10)-(d9+k9)*y(16); %KP.KKPP
yprime(17)	=	-a10*y(17)*[KPase]+d10*y(18)+k9*y(16); %KPP
yprime(18)	=	a10*y(17)*[KPase]-(d10+k10)*y(18); %KPP.KPase

end