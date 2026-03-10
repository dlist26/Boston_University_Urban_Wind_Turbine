wind_amp = 3.5;
wind_offset = 3.5;
wind_freq = 0.1;
n = 1000000;
t_max = 1000;
t = linspace(0,t_max,n);
wind_cutoff = 2.5; %m/s
for i =1:n
    v(i) = wind_amp*sin(wind_freq*2*pi()*t(i))+wind_offset;
    if v(i) < wind_cutoff
        v(i) = 0;
    end
end

figure(1)
plot(t, v)
axis([0,100,0,7])

rho_air = 1.225; % kg/m^3
turbine_diameter = 4; %m
turbine_area = pi()*turbine_diameter^2*0.25; %m^2
eff = 0.35;
power = eff*0.5*rho_air*turbine_area*v.^3;

figure(2)
plot(t, power)
axis([0,100,0,3000])
tot_energy = cumtrapz(t,power);
%plot(t, tot_energy)
avg_power = tot_energy(n)/t_max %W