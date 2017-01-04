%function MAPK_ultrasensitivity_Param_IC_enter.m written 1-4-17 by JTN to
%return parameters and initial conditions for a given value of E1tot

function [q,IC] = MAPK_ultrasensitivity_Param_IC_enter(E1tot)
    
    %Define rate constants
    K = 300*ones(10,1);
    
%      K(1) = 300;
%      K(9) = 1500;
       
    qK = K - 1; %Km = (d+k)/a, assuming a,d == 1

    
    %total values
    KKKtot      = 3;
    KKtot       = 1.2e3;
    Ktot        = 1.2e3;
    E2tot       = 0.3;
    KKPasetot   = 0.3;
    KPasetot    = 120;
    
    q = [qK; E1tot; E2tot; KKPasetot; KPasetot];

    
    %define initial conditions from tot params.
    KKKdE1      = min(E1tot / 2, KKKtot); %to ensure that KKK not negative
    KKK         = KKKtot - KKKdE1;
    KKKP        = 0;
    KKKPdE2     = 0;
        
    KK          = KKtot;
    KKP         = 0;
    KKPP        = 0;
    KKdKKKP     = 0;
    KKPdKKKP    = 0;
    KKPdKKPase  = 0;
    KKPPdKKPase = 0;
    
    
    K           = Ktot;
    KP          = 0;
    KPP         = 0;
    KdKKPP      = 0;
    KPdKKPP     = 0;
    
        
    KPdKPase    = 0;
    KPPdKPase   = 0;
    
    
    IC = [KKK,KKKdE1,KKKP,KKKPdE2, KK, KKdKKKP, KKP, KKPdKKPase, KKPdKKKP, ...
        KKPP, KKPPdKKPase, K, KdKKPP, KP, KPdKPase, KPdKKPP, KPP, KPPdKPase];
end