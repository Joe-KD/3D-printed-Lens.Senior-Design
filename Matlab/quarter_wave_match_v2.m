%%  CONSTANTS
eps_0 = 8.85*10^(-12); %permittivity
eps_air = 1.0006;
mu_0 = 1; %permeability
c = 299792458;
f = 10e9;
lam0 = c/f;



%% Dielectric Disc Permittivity Values
% At some point integrate with the dielectric generation code.
eps_r = [4.1889; 5.688; 7.4292; 9.4026];
% eps_r1 = 4.1789; 
% eps_r2 = 5.688;
% eps_r3 = 7.4292;
% eps_r4 = 9.4026;

%% Calculate New Permittivity
epsp_r = zeros(4,1);
for ii = 1:length(eps_r)
    epsp_r(ii) = eps_r(ii) - (lam0/(2*pi))^2;
end

% epsp_r1 = eps_r(1) - (lam0/(2*pi))^2;
% epsp_r2 = eps_r(2) - (lam0/(2*pi))^2;
% epsp_r3 = eps_r(3) - (lam0/(2*pi))^2;
% epsp_r4 = eps_r(4) - (lam0/(2*pi))^2;

%% Calculate new matching layer perm and height
epsp_m = zeros(4,1);
for ii = 1:length(eps_r)
    epsp_m(ii) = lam0 ./ epsp_r(ii);
end

% epsp_m1 = lam0/epsp_r1^(1/4);
% epsp_m2 = lam0/epsp_r2^(1/4);
% epsp_m3 = lam0/epsp_r3^(1/4);
% epsp_m4 = lam0/epsp_r4^(1/4);

match_h = zeros(4,1);
for ii = 1:length(eps_r)
    match_h(ii) = epsp_m(ii).*(1.4);
end


% epsp_h1 = epsp_m1*(1/4);
% epsp_h2 = epsp_m2*(1/4);
% epsp_h3 = epsp_m3*(1/4);
% epsp_h4 = epsp_m4*(1/4);