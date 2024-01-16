% 7/15

clear all, close all
% Lowpass filter design
N = 144;                                                % FIR filter length
Fp = 0.9/3; Fs = 1/3; amp =  [1,1,0,0];                 % Setting filter design parameters
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
e0 = h(1:2:length(h)); e1 = h(2:2:length(h));
E0=reshape(e0,3,length(e0)/3);
E1=reshape(e0,3,length(e1)/3);

% Down-sampling
u1 = x;
u0 = [0,x(1:length(x)-1)];
u00d = u0(1:3:length(u0));
u01d = [0,u0(3:3:length(u0))];
u02d = [0,u0(2:3:length(u0))];
u10d = u1(1:3:length(u1));
u11d = [0,u1(3:3:length(u1))];
u12d = [0,u1(2:3:length(u1))];

% Polyphase filtering
x00 = filter(2*E0(1,:),1,u00d);
x01 = filter(2*E0(2,:),1,u01d);
x02 = filter(2*E0(3,:),1,u02d);
x10 = filter(2*E1(1,:),1,u10d);
x11 = filter(2*E1(2,:),1,u11d);
x12 = filter(2*E1(3,:),1,u12d);

yy0=x00+x01+x02;
yy1=x10+x11+x12;

y0ii=zeros(1,L*length(yy0));
y1ii=zeros(1,L*length(yy1));
y0ii(1:L:length(y0ii))=yy0;                            % Up-sampled signal
y1ii(1:L:length(y1ii))=yy1;                            % Up-sampled signal

y1 = [0,(y1ii(1:(length(y1ii)-1)))];

y = y0ii+y1;                                             % Output signal
[Y,f] = freqz(y,1,512,Fy);                               % Frequency response of the output signal
subplot(2,1,2), plot(f/1000,abs(Y))
xlabel('Frequency [kHz]'), ylabel('|Y(F)|'), axis([0,16,0,0.7])
title('Spectrum of the Output Signal')
