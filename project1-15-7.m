clear all, close all
% Lowpass filter design
h = firgr(143,[0,0.9/3,1/3,1], [1,1,0,0]); [H,f]=freqz(h,1,512,2);
figure (1)
subplot(3,1,1), plot(f,20*log10(abs(H)))
xlabel('Normalized Frequency [\omega/\pi]'), ylabel('Gain [dB]')
axis([0,1,-60,2])
% Input signal x[n]
Fx = 32000; Fy = 48000;
F = [0,2/3+1/5,1]; m = [0,1,0]; % Setting the input parameters for fir2
x = fir2(255,F,m); % Generating the original signal ‘x’
[X,f] = freqz(x,1,512,Fx); % Spectrum of the original signal

subplot(3,1,2), plot(f/1000,abs(X))
xlabel('Frequency [kHz]'), ylabel('|X|'), axis([0,16,0,1])
% Polyphase decomposition
e0 = h(1:2:length(h)); e1 = h(2:2:length(h));
e00 = 3*e0(1:3:length(e0)); e01 = 3*e0(2:3:length(e0)); e02 = 3*e0(3:3:length(e0));
e10 = 3*e1(1:3:length(e1)); e11 = 3*e1(2:3:length(e1)); e12 = 3*e1(3:3:length(e1));
% Down-sampling and polyphase filtering
u0 = x;
u1 = [0,x(1:length(x)-1)];
u02 = u0(1:2:length(u0));
u12 = u1(1:2:length(u1));
x00 = filter(e00,1,u02);
x01 = filter(e01,1,u02);
x02 = filter(e02,1,u02);
x10 = filter(e10,1,u12);


x11 = filter(e11,1,u12);
x12 = filter(e12,1,u12);

% Up-sampling
yy0 = [x00;x01;x02];

yy1 = [x10;x11;x12];
y0 = yy0(:);
y1 = yy1(:);
yy = [0,(y0(1:length(y0)-1))'];
y = (yy'+y1); [Y,f] = freqz(y,1,512,Fy); % Output signal
subplot(3,1,3), plot(f/1000,abs(Y))
xlabel('Frequency [kHz]'), ylabel('|Y|'), axis([0,24,0,1.5])
