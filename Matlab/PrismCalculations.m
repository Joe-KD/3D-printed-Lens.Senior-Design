%questions

%% Prism Dimensions
% uses traditional Risley prism dimensions to find fractional volume for a
% variable desity prism
clear all 
close all
%% Constants 
f = 5.85e9; %5.5025e9;
c = 299792458;
u0 = 4*pi*10^-7;
e0 = 8.85418782*10^-12;
omega = 2*pi*f;
ep = 10; %3D printer dielectric
lambda0 = c/f;
lambda_er1 = c/(f*sqrt(ep));
k = 2*pi/lambda0;
kr = 2*pi/lambda_er1;
in2m = 0.0254; 
deg2rad = pi/180;

%% Antenna Aperture Dimensions
% MITRE Horn Dimensions
    w_ant = 9.5*in2m; 
    h_ant = 5.75*in2m;
    w_lambda = w_ant/lambda0;
    h_lambda = h_ant/lambda0;
%% Wedge Parameters

% L_prism = w_ant; %length of structure
% 
theta = 60*deg2rad; %specified steering angle from surface normal
% PHI = asin(theta_P1/sqrt(ep)); %specified wedge angle
% %R = N*PatchWidth + (N-1)*E_spacing; %set by size of antenna aperture in meters include +lambda/2 if performance suck
% %wedge_height = R*tan(PHI);
% max_unit_wedge_height = lambda_er1 ; %max height of first wedge density 1. 
% unit_wedge_length = max_unit_wedge_height/tan(PHI);
% unit_wedge_length_lambda = unit_wedge_length/lambda_er1; %wavelengths
% num_of_unit_wedges = w_ant/unit_wedge_length; %eventually change to IF statement for whole unit cells



%% Dielectric values
er_min = 1.25; %will eventually be specified by 3D printers
er_max = ep;
sqrt_er_dx = sqrt(er_max)-sqrt(er_min);
h_2 = lambda0/sqrt_er_dx;
gg = lambda0/h_2;
D = lambda0/cos(theta); %cell size based on modulo 2pi spacing

N = 3;
Dx = D/(N+1);
n = 0:1:N;
d_x = D.*(n/N);
%m = 0:1:2;
m = 2;

% et = 1:9/(N-1):10; %permittivity for optimization
%h_px = ((n.*cos(theta)+(lambda0.*m))./sqrt(et)); %height vector for optimization 
% h_prism = sqrt(2)*lambda0; %a guess

h_min = ((sqrt_er_dx)./(m.*lambda0)).^-1;
h_max = ((sqrt_er_dx)./((1+m).*lambda0)).^-1;

%h_prism_min = lambda0/sqrt(er_min); %height of prism we can call it whatever we want
%h_prism_max = ((n(N)*cos(theta)+(lambda0*(N-1)))/sqrt(10));
%h_px = h_prism_min:(h_prism_max-h_prism_min)/(N-1):h_prism_max;
h_m = (h_max - h_min)/(h_max+h_min);
h_g = sqrt(h_max*h_min); %geometric meam

sqrt_er_x = (d_x.*cos(theta)+(m.*lambda0))./(h_min);
sqrt_er_x2 = ((n./N)+m).*(lambda0./h_min);
er_x = (sqrt_er_x2).^2;

% indexs values outside of our allowable range
for ii = 1:length(sqrt_er_x2)
if any(sqrt_er_x2(1,ii)> sqrt(er_max));
    index(ii) = sqrt_er_x2(ii) - sqrt(er_max);
end
end

%  plot(h_px,et)
%  hold on
% plot(h_px,er_x)
%  legend('et','er_x')

%what percent is each er_x of max fill
er_p = (er_x./er_x(N+1));

kk = 1:1:150
hh = mod(150,kk)







