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
m_max = 10;
n = 1:4;


%% setting up vectors
er_mat = repmat( er, size(n));
n_mat = repmat(n, 100, 1);

h.m = struct('v',{});
for m = 1:10
    h.m{m} = (k0*(lam0/2)*er_mat.^(1/4)+k0*(lam0*n_mat)/4+(2*pi.*n_mat*m)/N + pi)./(k0*sqrt(er_mat));
end

%% Plots visualizing h vs er_n at various multiples of m

figure
plot(h.m{10}, er_mat)
legend('n = 1','n = 2','n = 3','n = 4')
xlabel('Total height h = h'' + 2\delta')
ylabel('\bf\epsilon_r')
er_n = [9.727, 6.182, 3.364, 1.273];
%% Calculate structure height
% h_p = h + 2*delt
for ii = n
    delt(ii) = lam0/(2*er_n(ii)^(1/4));
end
h_p = .06*ones(1,4) - 2.*(delt);


%% Other way
% 
% for ii = n
%     er_a(ii) = (((ii*pi)/(4*lam0)-(2*pi*4*ii)/4+pi)./(k0.*.039)).^2;
% end
