%MAPK_ultrasensitivity_ODE.m written 1-2-17 by JTN to simulate MAPK
%cascade, as done in Huang and Ferrell 1996

function yprime = MAPK_ultrasensitivity_ODE(t,y,q)

    %algebraic equations
    E1 = q(11) - y(2); %(E1 = [E1tot] - [kkk.E1])
    E2 = q(12) - y(4); %(E1 = [E2tot] - [kkkP.E2])
    KKPase = q(13) - y(11) - y(9); %(KKPase = KKPasetot - KKP.KKPase - KKPP.KKPase)
    KPase = q(14) - y(15) - y(18); %(KPase = KPasetot - KP.KPase - KPP.KPase)
    
    yprime = zeros(length(y),1);
    
    
    %differential equations
    yprime(1)	=	-y(1)*E1+y(2)+q(2)*y(4); %KKK
    yprime(2)	=	y(1)*E1-(1+q(1))*y(2); %KKK.E1
    yprime(3)	=	-y(3)*E2+y(4)+q(1)*y(2)+(q(3)+1)*y(6) - y(3)*y(5)+(q(5)+1)*y(9)-y(7)*y(3); %KKKP
    yprime(4)	=	y(3)*E2-(1+q(2))*y(4); %KKKP.E2
    yprime(5)	=	-y(5)*y(3)+y(6)+q(4)*y(8); %KK
    yprime(6)	=	y(5)*y(3)-(1+q(3))*y(6); %KK.KKKP
    yprime(7)	=	-y(7)*KKPase+y(8)+q(3)*y(6)+q(6)*y(11)+y(9)-y(7)*y(3); %KKP
    yprime(8)	=	y(7)*KKPase-(1+q(4))*y(8); %KKP.KKPase
    yprime(9)	=	y(7)*y(3)-(1+q(5))*y(9); %KKP.KKKP
    yprime(10)	=	q(5)*y(9)-y(10)*KKPase+y(11)-y(10)*y(12)+(1+q(7))*y(13)+(1+q(9))*y(16)-y(14)*y(10); %KKPP
    yprime(11)	=	y(10)*KKPase-(1+q(6))*y(11); %KKPP.KKPase
    yprime(12)	=	-y(12)*y(10)+y(13)+q(8)*y(15); %K
    yprime(13)	=	y(12)*y(10)-(1+q(7))*y(13); %K.KKPP
    yprime(14)	=	q(7)*y(13)-y(14)*KPase+y(15)-y(14)*y(10)+y(16)+q(10)*y(18); %KP
    yprime(15)	=	y(14)*KPase-(1+q(8))*y(15); %KP.KPase
    yprime(16)	=	y(14)*y(10)-(1+q(9))*y(16); %KP.KKPP
    yprime(17)	=	-y(17)*KPase+y(18)+q(9)*y(16); %KPP
    yprime(18)	=	y(17)*KPase-(1+q(10))*y(18); %KPP.KPase

end