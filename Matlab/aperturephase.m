epsilons = [5.28896105060776 6.52958154396020 7.90079366819184 9.40259742330268];

h = 0.0391;

c = 299792458;
f = 10e9;

lam0 = c/f;
k0 = 2*pi/lam0;
d=lam0/8;

x = (1:100)*d;
phase = zeros(size(x));

for ii = 1:length(x)
    phase(ii) = k0*h*sqrt(epsilons(mod(ii,length(epsilons))+1))*180/pi;
end

plot(x*1000, phase-360*3)
xlabel('distance (mm)')
ylabel('phase (degrees)')
grid on

