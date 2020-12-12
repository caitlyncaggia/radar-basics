% ECE 4390 - Caitlyn Caggia
% Homework 1 Problem 3

%set constants/assumptions
psi = 1; %noise voltage variance
V = linspace(0,20,100); %voltage variation
A = 2; %signal level
Vt = 11; %detection threshold

%probability of false alarm
Pfa = exp( Vt.^2 / (-2*psi) ); 

%probability of detection
Io = besseli(0,(V*A/psi)); %bessel function of zero order
Pd = V./psi .* exp(-1*(V.^2 + A^2)/(2*psi)) .* Io;

%calculate SNR
A = log(0.62./Pfa);
B = log(Pd./(1-Pd));
SNR = A + 0.12.*A.*B + 1.7.*B;
SNR_dB = log10(SNR);

%check against Matlab's algorithm for Pfa and Pd
SNR_dB2 = linspace(-20,20,200);
[Pd2, Pfa2] = rocsnr(SNR_dB2);
%assumes a single pulse signal.
%each column of Pd is the probability of detection for a given SNR value.
%Pfa is a column vector shared by all SNR values.

%create Pfa plot
subplot(1,2,2)
imagesc(V,SNR_dB2,log10(abs(Pfa2)));
axis xy
colorbar
caxis([-12 0])
title("log10(Pfa)")
ylabel("SNR (dB)")
xlabel("Vthreshold/sqrt(psi)")

%create Pd plot
subplot(1,2,1)
imagesc(V, SNR_dB2, log10(abs(Pd2)));
axis xy
title("log10(Pd)")
ylabel("SNR (dB)")
xlabel("Vthreshold/sqrt(psi)")