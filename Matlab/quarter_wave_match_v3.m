clear all
close all
%% Eqs
% k0*(n/N)*sin(theta)+(n*2*pi)/N = k0*sqrt(eps_r(n))*h_p

%%  CONSTANTS
eps_0 = 8.85*10^(-12); %permittivity
eps_air = 1.0006;
mu_0 = 1; %permeability
c = 299792458;
f = 10e9;
lam0 = c/f;
k0 = (2*pi)/lam0;
N = 4;
er = linspace(1,10,100);
er = er';
m = 1:10;
n = 1:4;

%delt = 
%h_p = h + 2*delt;

%% setting up vectors

%end
er_mat = repmat( er, size(n));
n_mat = repmat(n, 100, 1);
%m_mat = repmat(n, 100, 1);

%plot(eps_r,y);
%h_1 = (lam0/2)*er_mat.^(1/4);
%h_2 = (2*pi.*n.*m)/N + pi;
h = ((lam0/2)*er_mat.^(1/4)+(2*pi.*n_mat*1)/N + pi)./(k0*sqrt(er_mat));
