% 7/15

clear all, close all
% Lowpass filter design
N = 630;                                                % FIR filter length
%N = 420;
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
e5 = h(6:7:length(h)); e6 = h(7:7:length(h));


%E0 = reshape(E(1, :), 15, length(E(1, :)) / 15);

E0=reshape(e0,15,length(e0)/15);
E1=reshape(e1,15,length(e1)/15);
E2=reshape(e2,15,length(e2)/15);
E3=reshape(e3,15,length(e3)/15);
E4=reshape(e4,15,length(e4)/15);

E5=reshape(e5,15,length(e5)/15);
E6=reshape(e6,15,length(e6)/15);


% Down-sampling
u1 = x;
u0 = [0,x(1:length(x)-1)];

u2 = [0, 0, x(1:length(x)-2)];
u3 = [0, 0, 0, x(1:length(x)-3)];
u4 = [0, 0, 0, 0, x(1:length(x)-4)];
u5 = [0, 0, 0, 0, 0, x(1:length(x)-5)];
u6 = [0, 0, 0, 0, 0, 0, x(1:length(x)-6)];

u00d = u0(1:15:length(u0));
u01d = [0,u0(15:15:length(u0))];
u02d = [0,u0(2:15:length(u0))];
u03d = [0,u0(3:15:length(u0))];
u04d = [0,u0(4:15:length(u0))];
u05d = [0,u0(5:15:length(u0))];
u06d = [0,u0(6:15:length(u0))];
u07d = [0,u0(7:15:length(u0))];
u08d = [0,u0(8:15:length(u0))];
u09d = [0,u0(9:15:length(u0))];
u010d = [0,u0(10:15:length(u0))];
u011d = [0,u0(11:15:length(u0))];
u012d = [0,u0(12:15:length(u0))];
u013d = [0,u0(13:15:length(u0))];
u014d = [0,u0(14:15:length(u0))];

u10d = u1(1:15:length(u1));
u11d = [0,u1(15:15:length(u1))];
u12d = [0,u1(2:15:length(u1))];
u13d = [0,u1(3:15:length(u1))];
u14d = [0,u1(4:15:length(u1))];
u15d = [0,u1(5:15:length(u1))];
u16d = [0,u1(6:15:length(u1))];
u17d = [0,u1(7:15:length(u1))];
u18d = [0,u1(8:15:length(u1))];
u19d = [0,u1(9:15:length(u1))];
u110d = [0,u1(10:15:length(u1))];
u111d = [0,u1(11:15:length(u1))];
u112d = [0,u1(12:15:length(u1))];
u113d = [0,u1(13:15:length(u1))];
u114d = [0,u1(14:15:length(u1))];


u20d = u2(1:15:length(u2));
u21d = [0,u2(15:15:length(u2))];
u22d = [0,u2(2:15:length(u2))];
u23d = [0,u2(3:15:length(u2))];
u24d = [0,u2(4:15:length(u2))];
u25d = [0,u2(5:15:length(u2))];
u26d = [0,u2(6:15:length(u2))];
u27d = [0,u2(7:15:length(u2))];
u28d = [0,u2(8:15:length(u2))];
u29d = [0,u2(9:15:length(u2))];
u210d = [0,u2(10:15:length(u2))];
u211d = [0,u2(11:15:length(u2))];
u212d = [0,u2(12:15:length(u2))];
u213d = [0,u2(13:15:length(u2))];
u214d = [0,u2(14:15:length(u2))];

u30d = u3(1:15:length(u3));
u31d = [0,u3(15:15:length(u3))];
u32d = [0,u3(2:15:length(u3))];
u33d = [0,u3(3:15:length(u3))];
u34d = [0,u3(4:15:length(u3))];
u35d = [0,u3(5:15:length(u3))];
u36d = [0,u3(6:15:length(u3))];
u37d = [0,u3(7:15:length(u3))];
u38d = [0,u3(8:15:length(u3))];
u39d = [0,u3(9:15:length(u3))];
u310d = [0,u3(10:15:length(u3))];
u311d = [0,u3(11:15:length(u3))];
u312d = [0,u3(12:15:length(u3))];
u313d = [0,u3(13:15:length(u3))];
u314d = [0,u3(14:15:length(u3))];

u40d = u4(1:15:length(u4));
u41d = [0,u4(15:15:length(u4))];
u42d = [0,u4(2:15:length(u4))];
u43d = [0,u4(3:15:length(u4))];
u44d = [0,u4(4:15:length(u4))];
u45d = [0,u4(5:15:length(u4))];
u46d = [0,u4(6:15:length(u4))];
u47d = [0,u4(7:15:length(u4))];
u48d = [0,u4(8:15:length(u4))];
u49d = [0,u4(9:15:length(u4))];
u410d = [0,u4(10:15:length(u4))];
u411d = [0,u4(11:15:length(u4))];
u412d = [0,u4(12:15:length(u4))];
u413d = [0,u4(13:15:length(u4))];
u414d = [0,u4(14:15:length(u4))];

u50d = u5(1:15:length(u5));
u51d = [0,u5(15:15:length(u5))];
u52d = [0,u5(2:15:length(u5))];
u53d = [0,u5(3:15:length(u5))];
u54d = [0,u5(4:15:length(u5))];
u55d = [0,u5(5:15:length(u5))];
u56d = [0,u5(6:15:length(u5))];
u57d = [0,u5(7:15:length(u5))];
u58d = [0,u5(8:15:length(u5))];
u59d = [0,u5(9:15:length(u5))];
u510d = [0,u5(10:15:length(u5))];
u511d = [0,u5(11:15:length(u5))];
u512d = [0,u5(12:15:length(u5))];
u513d = [0,u5(13:15:length(u5))];
u514d = [0,u5(14:15:length(u5))];

u60d = u6(1:15:length(u6));
u61d = [0,u6(15:15:length(u6))];
u62d = [0,u6(2:15:length(u6))];
u63d = [0,u6(3:15:length(u6))];
u64d = [0,u6(4:15:length(u6))];
u65d = [0,u6(5:15:length(u6))];
u66d = [0,u6(6:15:length(u6))];
u67d = [0,u6(7:15:length(u6))];
u68d = [0,u6(8:15:length(u6))];
u69d = [0,u6(9:15:length(u6))];
u610d = [0,u6(10:15:length(u6))];
u611d = [0,u6(11:15:length(u6))];
u612d = [0,u6(12:15:length(u6))];
u613d = [0,u6(13:15:length(u6))];
u614d = [0,u6(14:15:length(u6))];

 

% Polyphase filtering

% x00 = filter(2*E0(1,:),1,u00d);
% x01 = filter(2*E0(2,:),1,u01d);
% x02 = filter(2*E0(3,:),1,u02d);

x00 = filter(7*E0(1,:),1,u00d);
x01 = filter(7*E0(2,:),1,u01d);
x02 = filter(7*E0(3,:),1,u02d);
x03 = filter(7*E0(4,:),1,u03d);
x04 = filter(7*E0(5,:),1,u04d);
x05 = filter(7*E0(6,:),1,u05d);
x06 = filter(7*E0(7,:),1,u06d);
x07 = filter(7*E0(8,:),1,u07d);
x08 = filter(7*E0(9,:),1,u08d);
x09 = filter(7*E0(10,:),1,u09d);
x010 = filter(7*E0(11,:),1,u010d);
x011 = filter(7*E0(12,:),1,u011d);
x012 = filter(7*E0(13,:),1,u012d);
x013 = filter(7*E0(14,:),1,u013d);
x014 = filter(7*E0(15,:),1,u014d);

x10 = filter(7*E1(1,:),1,u10d);
x11 = filter(7*E1(2,:),1,u11d);
x12 = filter(7*E1(3,:),1,u12d);
x13 = filter(7*E1(4,:),1,u13d);
x14 = filter(7*E1(5,:),1,u14d);
x15 = filter(7*E1(6,:),1,u15d);
x16 = filter(7*E1(7,:),1,u16d);
x17 = filter(7*E1(8,:),1,u17d);
x18 = filter(7*E1(9,:),1,u18d);
x19 = filter(7*E1(10,:),1,u19d);
x110 = filter(7*E1(11,:),1,u110d);
x111 = filter(7*E1(12,:),1,u111d);
x112 = filter(7*E1(13,:),1,u112d);
x113 = filter(7*E1(14,:),1,u113d);
x114 = filter(7*E1(15,:),1,u114d);

x20 = filter(7*E2(1,:),1,u20d);
x21 = filter(7*E2(2,:),1,u21d);
x22 = filter(7*E2(3,:),1,u22d);
x23 = filter(7*E2(4,:),1,u23d);
x24 = filter(7*E2(5,:),1,u24d);
x25 = filter(7*E2(6,:),1,u25d);
x26 = filter(7*E2(7,:),1,u26d);
x27 = filter(7*E2(8,:),1,u27d);
x28 = filter(7*E2(9,:),1,u28d);
x29 = filter(7*E2(10,:),1,u29d);
x210 = filter(7*E2(11,:),1,u210d);
x211 = filter(7*E2(12,:),1,u211d);
x212 = filter(7*E2(13,:),1,u212d);
x213 = filter(7*E2(14,:),1,u213d);
x214 = filter(7*E2(15,:),1,u214d);

x30 = filter(7*E3(1,:),1,u30d);
x31 = filter(7*E3(2,:),1,u31d);
x32 = filter(7*E3(3,:),1,u32d);
x33 = filter(7*E3(4,:),1,u33d);
x34 = filter(7*E3(5,:),1,u34d);
x35 = filter(7*E3(6,:),1,u35d);
x36 = filter(7*E3(7,:),1,u36d);
x37 = filter(7*E3(8,:),1,u37d);
x38 = filter(7*E3(9,:),1,u38d);
x39 = filter(7*E3(10,:),1,u39d);
x310 = filter(7*E3(11,:),1,u310d);
x311 = filter(7*E3(12,:),1,u311d);
x312 = filter(7*E3(13,:),1,u312d);
x313 = filter(7*E3(14,:),1,u313d);
x314 = filter(7*E3(15,:),1,u314d);

x40 = filter(7*E4(1,:),1,u40d);
x41 = filter(7*E4(2,:),1,u41d);
x42 = filter(7*E4(3,:),1,u42d);
x43 = filter(7*E4(4,:),1,u43d);
x44 = filter(7*E4(5,:),1,u44d);
x45 = filter(7*E4(6,:),1,u45d);
x46 = filter(7*E4(7,:),1,u46d);
x47 = filter(7*E4(8,:),1,u47d);
x48 = filter(7*E4(9,:),1,u48d);
x49 = filter(7*E4(10,:),1,u49d);
x410 = filter(7*E4(11,:),1,u410d);
x411 = filter(7*E4(12,:),1,u411d);
x412 = filter(7*E4(13,:),1,u412d);
x413 = filter(7*E4(14,:),1,u413d);
x414 = filter(7*E4(15,:),1,u414d);

x50 = filter(7*E5(1,:),1,u50d);
x51 = filter(7*E5(2,:),1,u51d);
x52 = filter(7*E5(3,:),1,u52d);
x53 = filter(7*E5(4,:),1,u53d);
x54 = filter(7*E5(5,:),1,u54d);
x55 = filter(7*E5(6,:),1,u55d);
x56 = filter(7*E5(7,:),1,u56d);
x57 = filter(7*E5(8,:),1,u57d);
x58 = filter(7*E5(9,:),1,u58d);
x59 = filter(7*E5(10,:),1,u59d);
x510 = filter(7*E5(11,:),1,u510d);
x511 = filter(7*E5(12,:),1,u511d);
x512 = filter(7*E5(13,:),1,u512d);
x513 = filter(7*E5(14,:),1,u513d);
x514 = filter(7*E5(15,:),1,u514d);

x60 = filter(7*E6(1,:),1,u60d);
x61 = filter(7*E6(2,:),1,u61d);
x62 = filter(7*E6(3,:),1,u62d);
x63 = filter(7*E6(4,:),1,u63d);
x64 = filter(7*E6(5,:),1,u64d);
x65 = filter(7*E6(6,:),1,u65d);
x66 = filter(7*E6(7,:),1,u66d);
x67 = filter(7*E6(8,:),1,u67d);
x68 = filter(7*E6(9,:),1,u68d);
x69 = filter(7*E6(10,:),1,u69d);
x610 = filter(7*E6(11,:),1,u610d);
x611 = filter(7*E6(12,:),1,u611d);
x612 = filter(7*E6(13,:),1,u612d);
x613 = filter(7*E6(14,:),1,u613d);
x614 = filter(7*E6(15,:),1,u614d);


yy0=x00+x01+x02+x03+x04+x05+x06+x07+x08+x09+x010+x011+x012+x013+x014;
yy1=x10+x11+x12+x13+x14+x15+x16+x17+x18+x19+x110+x111+x112+x113+x114;
yy2=x20+x21+x22+x23+x24+x25+x26+x27+x28+x29+x210+x211+x212+x213+x214;
yy3=x30+x31+x32+x33+x34+x35+x36+x37+x38+x39+x310+x311+x312+x313+x314;

yy4=x40+x41+x42+x43+x44+x45+x46+x47+x48+x49+x410+x411+x412+x413+x414;
yy5=x50+x51+x52+x53+x54+x55+x56+x57+x58+x59+x510+x511+x512+x513+x514;
yy6=x60+x61+x62+x63+x64+x65+x66+x67+x68+x69+x610+x611+x612+x613+x614;

y0ii=zeros(1,L*length(yy0));
y1ii=zeros(1,L*length(yy1));
y2ii=zeros(1,L*length(yy2));
y3ii=zeros(1,L*length(yy3));

y4ii=zeros(1,L*length(yy4));
y5ii=zeros(1,L*length(yy5));
y6ii=zeros(1,L*length(yy6));


% Up-sampled signals

y0ii(1:L:length(y0ii))=yy0;                            
y1ii(1:L:length(y1ii))=yy1;  
y2ii(1:L:length(y2ii))=yy2;
y3ii(1:L:length(y3ii))=yy3;

y4ii(1:L:length(y4ii))=yy4;
y5ii(1:L:length(y5ii))=yy5;
y6ii(1:L:length(y6ii))=yy6;


% y1 = [0,(y1ii(1:(length(y1ii)-1)))];
% 
% y = y0ii+y1;                                             % Output signal
% [Y,f] = freqz(y,1,512,Fy);                               % Frequency response of the output signal
% subplot(2,1,2), plot(f/1000,abs(Y))
% xlabel('Frequency [kHz]'), ylabel('|Y(F)|'), axis([0,16,0,0.7])
% title('Spectrum of the Output Signal')


y1 = [0,(y1ii(1:(length(y1ii)-1)))];
y = y0ii+y2ii+y3ii+y4ii+y5ii+y6ii+y1;
[Y,f] = freqz(y,1,512,Fy);
subplot(2,1,2), plot(f/1000,abs(Y))
xlabel('Frequency [kHz]'), ylabel('|Y(F)|'), axis([0,16,0,0.7])
title('Spectrum of the Output Signal')
