% 7/15

clear all, close all
% Lowpass filter design
N = 144;                                                % FIR filter length
Fp = 0.9/15; Fs = 1/15; amp =  [1,1,0,0];                 % Setting filter design parameters
h = firgr(N-1,[0,Fp,Fs,1], [1,1,0,0]);                  % Filter design
[H,f]=freqz(h,1,512,2);                                 % Filter frequency response
figure (1)
plot(f,20*log10(abs(H)))
xlabel('Normalized Frequency [\omega/\pi]'),  ylabel('Gain [dB]')
title('Figure 1: Filter characteristic')
axis([0,1,-60,2])

% Generating the input signal {x[n]}
L=7; M=15;
Fx = 48000; Fy = 32000;
F = [0,0.1,0.66,1]; m = [0,1,0,0];                      % Setting the input parameters for fir2
x = fir2(255,F,m);                                      % Generating the original signal {x[n]}
[X,f] = freqz(x,1,512,Fx);                              % Spectrum of the original signal
figure (2)
subplot(2,1,1),  plot(f/1000,abs(X))
xlabel('Frequency [kHz]'), ylabel('|X(F)|'), axis([0,24,0,1])
title('Figure 2, Spectrum of the original signal')

% Polyphase decomposition
e0 = h(1:7:length(h)); e1 = h(2:7:length(h));e2 = h(3:7:length(h)); e3 = h(4:7:length(h)); e4 = h(5:7:length(h));
e5 = h(6:7:length(h)); e6 = h(7:7:length(h));e7 = h(8:7:length(h)); e8 = h(9:7:length(h)); e9 = h(10:7:length(h));
e10 = h(11:7:length(h)); e11 = h(12:7:length(h));e12 = h(13:7:length(h)); e13 = h(14:7:length(h)); 

E0=reshape(e0,15,length(e0)/15);
E1=reshape(e1,15,length(e1)/15);
E2=reshape(e2,15,length(e2)/15);
E3=reshape(e3,15,length(e3)/15);
E4=reshape(e4,15,length(e4)/15);

E5=reshape(e5,15,length(e5)/15);
E6=reshape(e6,15,length(e6)/15);
E7=reshape(e7,15,length(e7)/15);
E8=reshape(e8,15,length(e8)/15);
E9=reshape(e9,15,length(e9)/15);

E10=reshape(e10,15,length(e10)/15);
E11=reshape(e11,15,length(e11)/15);
E12=reshape(e12,15,length(e12)/15);
E13=reshape(e13,15,length(e13)/15);

