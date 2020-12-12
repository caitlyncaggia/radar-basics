%ECE 4390 - Homework 3
%Caitlyn Caggia

eta1 = 377;
Eeff = (1.3)^2*8.85e-12 - j*0.01/(2*pi*600e6);
eta2 = sqrt((4*pi)*10^(-7)/(Eeff));

%thetai from 0 to pi/2 (0 to 90 degrees)
thetais = linspace(0,pi/2,300);

for i = 1:length(thetas)
    thetai = thetais(i);
    
    %snell's law to find thetat
    thetat = asin(sin(thetai)/1.3);
    
    gammaTE = (eta2*cos(thetai) - eta1*cos(thetat)) / (eta2*cos(thetai) + eta1*cos(thetat)); 
    gammaTEmag(i) = abs(gammaTE);
    gammaTEangle(i) = angle(gammaTE);
    
    gammaTM = (-eta1*cos(thetai) + eta2*cos(thetat)) / (eta1*cos(thetai) + eta2*cos(thetat));
    gammaTMmag(i) = abs(gammaTM);
    gammaTMangle(i) = angle(gammaTM);
    
end

figure
subplot(2,1,1)
plot(thetais,gammaTEmag)
title('Magnitude of TE')
subplot(2,1,2)
plot(thetais,gammaTMmag)
title('Magnitude of TM')

figure
subplot(2,1,1)
plot(thetais,gammaTEangle)
title('Angle of TE')
subplot(2,1,2)
plot(thetais,gammaTMangle)
title('Angle of TM')

