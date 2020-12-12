%ECE 4390 - Homework 2, Problem 1
%Caitlyn Caggia

fprf = linspace(30, 300e3, 1000); %30 Hz to 300kHz
fc = linspace(1e3, 30000e3, 1000); %1 MHz to 30000 MHz

Ea = zeros(1,length(fc));
Eb = zeros(1, length(fc));

for i=1:length(fprf)
    %since we're diving Ea/Eb and both have 1/sqrt(SNR), ignore SNR in both
    %equations since the division will cancel it out
    tau = 0.01/fprf(i);
    Ea(i) = (1.18*3e8) / (2*pi*tau*fc(i));
    Eb(i) = (3e8*tau*sqrt(2)*fprf(i)) / (1.18);
end

imagesc(fc,fprf,log10(abs(Ea/Eb)));
axis xy
colorbar
caxis([-2 2])
title("log10(Ea/Eb)")
ylabel("Pulse Repetition Frequency (fprf)")
xlabel("Center Frequency (fc)")