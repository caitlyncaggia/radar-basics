%ECE 4390 - Homework 2, Problem 4
%Caitlyn Caggia

time = linspace(0,50,6);
rangeEst = [50 0 0 0 0 0]; %range estimate in km
errorEst = [.100 .100*1.025 0 0 0 0]; %range uncertainty in km
KalmanGain = zeros(1,6);
rangeMeas = [0 49.90 49.95 50.05 49.9 50.0]; % range measurement in km
errorMeas = [0 1.000 .600 .800 .400 .700]; %measurement error in km

for i = 2:length(time)
    
    %given estimation error grows 2.5% between every pulse
    errorEst(i) = errorEst(i-1)*1.025;
    
    %1. calculate kalman gain
    a = (errorEst(i) + errorMeas(i));
    b = errorEst(i);
    
    KalmanGain(i) = b / a;
    
    %2. calculate new estimate
    rangeEst(i) = rangeEst(i-1) + KalmanGain(i)*(rangeMeas(i) - rangeEst(i-1));
    
    %3. calculate new error in estimate
    %errorEst(i) = (errorMeas(i)*errorEst(i-1))/(errorMeas(i) + errorEst(i-1));
    
end

display(rangeEst)
display(errorEst)
display(KalmanGain)
