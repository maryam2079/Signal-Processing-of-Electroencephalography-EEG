clear all

file1 = load ('v1.mat');
file2 = load ('v3.mat');
file3 = load ('v5.mat');


v1 = file1.val(2,:);
v2 = file2.val(2,:);
v3 = file3.val(2,:);
duration = 10;
L = length(v1);
t = linspace(0,duration,L);

figure(1);
subplot(3,1,1);
plot(t,v1,'b')
xlabel('time(s)');
ylabel('v1 values');
subplot(3,1,2);
plot(t,v2,'b')
xlabel('time(s)');
ylabel('v3 values');
subplot(3,1,3);
plot(t,v3,'b')
xlabel('time(s)');
ylabel('v5 values');


V1 = fft(v1);
V1_shifted = fftshift(V1);
V2 = fft(v2);
V2_shifted = fftshift(V2);
V3 = fft(v3);
V3_shifted = fftshift(V3);
fs = L/duration;
frequency = (-L/2:L/2-1)*fs/L;



figure(2);
subplot(3,1,1);
plot(frequency,abs(V1_shifted),'b');
xlabel('frequency(Hz)');
ylabel('|V1|');
title('Frequency Response of v1');
subplot(3,1,2);
plot(frequency,abs(V2_shifted),'b');
xlabel('frequency(Hz)');
ylabel('|V3|');
title('Frequency Response of v3');
subplot(3,1,3);
plot(frequency,abs(V3_shifted),'b');
xlabel('frequency(Hz)');
ylabel('|V5|');
title('Frequency Response of v5');

f = (0:L-1)*fs/L;

%Delta Waves
FL = 0.5; FH = 4;
V1delta = V1;
dLow = f<FL; 
n1 = length(f(dLow));
V1delta(dLow)=0;
V1delta(end-n1+2:end) = 0; 
dHigh = f >= FL & f <= FH;
n2 = length(f(dHigh));
V1delta(n1+n2+1:end-n1-n2+1) = 0; 
delta=ifft(V1delta);


%Theta Waves
FL = 4; FH = 8;
V1theta = V1;
dLow = f<FL; 
n1 = length(f(dLow));
V1theta(dLow)=0;
V1theta(end-n1+2:end) = 0; 
dHigh = f >= FL & f <= FH;
n2 = length(f(dHigh));
V1theta(n1+n2+1:end-n1-n2+1) = 0; 
theta=ifft(V1theta);

%Alpha Waves
FL = 8; FH = 13;
V1alpha = V1;
dLow = f<FL; 
n1 = length(f(dLow));
V1alpha(dLow)=0;
V1alpha(end-n1+2:end) = 0; 
dHigh = f >= FL & f <= FH;
n2 = length(f(dHigh));
V1alpha(n1+n2+1:end-n1-n2+1) = 0; 
alpha=ifft(V1alpha);

%Beta Waves
FL = 13; FH = 35;
V1beta = V1;
dLow = f<FL; 
n1 = length(f(dLow));
V1beta(dLow)=0;
V1beta(end-n1+2:end) = 0; 
dHigh = f >= FL & f <= FH;
n2 = length(f(dHigh));
V1beta(n1+n2+1:end-n1-n2+1) = 0; 
beta=ifft(V1beta);

%Gamma Waves
FL = 35; FH = 80;
V1gamma = V1;
dLow = f<FL; 
n1 = length(f(dLow));
V1gamma(dLow)=0;
V1gamma(end-n1+2:end) = 0; 
dHigh = f >= FL & f <= FH;
n2 = length(f(dHigh));
V1gamma(n1+n2+1:end-n1-n2+1) = 0; 
gamma=ifft(V1gamma);

figure(3);
subplot(5,1,1);
plot(t,delta);
xlabel('time(s)');
title('Delta Waves');
subplot(5,1,2);
plot(t,theta);
xlabel('time(s)');
title('Theta Waves');
subplot(5,1,3);
plot(t,alpha);
xlabel('time(s)');
title('Alpha Waves');
subplot(5,1,4);
plot(t,beta);
xlabel('time(s)');
title('Beta Waves');
subplot(5,1,5);
plot(t,gamma);
xlabel('time(s)');
title('Gamma Waves');







