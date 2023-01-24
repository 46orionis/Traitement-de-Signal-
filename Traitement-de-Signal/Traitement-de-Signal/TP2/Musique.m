clear all 
close all
clc
%realiser par : Nilam

fe = 8192;
te = 1/fe;
t = [0:te:1];
N= length(t);
Do = sin(2*pi*t*262);
Re = sin(2*pi*t*294);
Mi = sin(2*pi*t*330);
Fa = sin(2*pi*t*349);
Sol = sin(2*pi*t*392);
La = sin(2*pi*t*440);
Si = sin(2*pi*t*494);
Do2 = sin(2*pi*t*523);




doremifasol_solfamiredo= [Do,Re,Mi,Fa,Sol,La,Si,Do2,Do2,Si,La,Sol,Fa,Mi,Re,Do];
Happy_Birthday =[Do,Re,Do,Fa,Mi,Mi,Do,Re,Do,Sol,Fa,Fa,Do,Si,La,Sol,Fa,Fa,Mi,La,Sol,Re,Fa,Mi];
Gamme=[Do,Re,Mi,Fa,Sol,La,Si,Do2];
% sound(doremifasol_solfamiredo,fe);
%sound(Happy_Birthday,fe);
%%
signalAnalyzer(Gamme);
spectrogram(Gamme)
a = length(Gamme);
fshift = (-a/2:(a/2)-1)*(fe/a);
y = fft(Gamme);

subplot(2,1,1)
plot(fshift,fftshift(abs(y)));
legend("Represenation du spectre d'une Octave");
xlabel("f");
ylabel("A");
subplot(2,1,2)
sig = 20*log(fftshift(abs(y)));

plot(fshift,sig);
legend("Represenation du spectre d'une Octave en dB");
xlabel("f");
ylabel("A");
