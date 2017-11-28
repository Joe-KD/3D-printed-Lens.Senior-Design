%%  CONSTANTS
eps_0 = 8.85*10^(-12); %permeability
eps_air = 1.0006;
mu_0 = 1; %permittivity

%% Dielectric Disc Permittivity Values
% At some point integrate with the dielectric generation code.
eps_r1 = 4.1789; 
eps_r2 = 5.688;
eps_r3 = 7.4292;
eps_r4 = 9.4026;

%% Impedence Calculation
% General: eta = sqrt(mu/eps). mu is treated as 1 for all calculations

eta_air = sqrt(1/1);
eta_r1 = sqrt(1/eps_r1);
eta_r2 = sqrt(1/eps_r2);
eta_r3 = sqrt(1/eps_r3);
eta_r4 = sqrt(1/eps_r4);

eta_m1 = sqrt(eta_air*eta_r1);
eta_m2 = sqrt(eta_air*eta_r2);
eta_m3 = sqrt(eta_air*eta_r3);
eta_m4 = sqrt(eta_air*eta_r4);

%% Recover Dielectric Values for Matching Layer

eps_m1 = 1/(eta_m1^2);
eps_m2 = 1/(eta_m2^2);
eps_m3 = 1/(eta_m3^2);
eps_m4 = 1/(eta_m4^2);