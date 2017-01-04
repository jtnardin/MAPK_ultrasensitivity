% MAPK_ultrasensitivity_simulate_ODE_system.m written 1-4-17 by JTN to
% simulate the ODE system of the MAPK cascade by Huang and Ferrel (1996).
% Simulates the ODE for various values of E1tot (enzyme to catalyze KKK ->
% KKKP) and then estimates hill coefficient for KKKP, KKPP, KPP.

clear all; clc

t = linspace(0,100,100);

%Use to get hill coeff for KKK
E1_range = [ 0:.001:.05 .25:.25:7.5];

%Use to get hill coeff for K, KK
% E1_range = 0:.001:.05;

KKKP_SS = zeros(length(E1_range),1);
KKPP_SS = zeros(length(E1_range),1);
KPP_SS = zeros(length(E1_range),1);

whole_time = tic;
%loop over E1tot values
for i = 1:length(E1_range)

    i
    
    %load in IC, parameters
    [q,IC] = MAPK_ultrasensitivity_Param_IC_enter(E1_range(i));

    %simulate ODE
    [t,y] = ode15s(@(t,y) MAPK_ultrasensitivity_ODE(t,y,q),t,IC);

    %get out KKKP, KKPP, KPP
    KKKP_SS(i) = y(end,3);
    KKPP_SS(i) = y(end,10);
    KPP_SS(i) = y(end,17);

end
end_all_time = toc(whole_time)

%Normalize values
KKK_rel     = KKKP_SS/max(KKKP_SS);
KK_rel      = KKPP_SS/max(KKPP_SS);
K_rel       = KPP_SS/max(KPP_SS);

%compute hill coefficients
KKK_n       = hill_compute(E1_range,KKK_rel,1)
KK_n       = hill_compute(E1_range,KK_rel,1)
K_n       = hill_compute(E1_range,K_rel,1)

%plot dose-response curve
figure
hold on
plot(log(E1_range),KKKP_SS/max(KKKP_SS));
plot(log(E1_range),KKPP_SS/max(KKPP_SS));
plot(log(E1_range),KPP_SS/max(KPP_SS));

legend('KKKP','KKPP','KPP')