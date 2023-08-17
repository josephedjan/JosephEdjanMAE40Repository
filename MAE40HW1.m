%% Problem 1 

clear 
clc

syms s I_L I_C I_R_Load V_o R_load L V_i C 

A = [-1 1 1 0;           % -I_L + I_C + I_R_Load + 0 = 0
    L*s 0 0 1;           % L*I_L*s + V_o(s) = V_i(s)
    0 -1 0 C*s;          % -I_C + C*Vo(s)*s = 0   
    0 0 R_load -1];      %  I_R_Load*R_Load - V_o = 0
b = [0; V_i; 0; 0]; 
x=A\b                    % x = [I_L; I_C; I_R_Load; V_o]
V_o = simplify(x(4))

%% Problem 2

% TF = Transfer Function
omega4 = 10; 
zeta = [0.1 0.7 1]; 

TF1 = RR_tf([omega4^2], [1 2*zeta(1)*omega4 omega4^2])
figure(1), 
RR_bode(TF1)
title(Zeta = 0.1)

TF2 = RR_tf([omega4^2], [1 2*zeta(2)*omega4 omega4^2])
figure(2), 
RR_bode(TF2)
title(Zeta = 0.7)

TF3 = RR_tf([omega4^2], [1 2*zeta(3)*omega4 omega4^2])
figure(3), 
RR_bode(TF3)
title(Zeta = 1)
