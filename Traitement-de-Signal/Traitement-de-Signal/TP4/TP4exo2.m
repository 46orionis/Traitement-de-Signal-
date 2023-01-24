clear all
close all
clc


[Music,fs]=audioread('test.wav');
 Music = Music';
 
 N = length(Music);
 
 f = (0:N-1)*(fs/N);
 fshift =(-N/2:(N/2)-1)*(fs/N);
 
 spectre_music = fft(Music);
 plot(fshift,fftshift(abs(spectre_music)));
 legend("spectre du signal d'origine"); 
 xlabel("f");
 ylabel("A");

 
 fc = 5000;
 K =1;
 
 H = K./(1+1i*(f/fc).^100);
 Hpass=[H(1:floor(N/2)),flip(H(1:floor(N/2)))];
 
 
y_filtre = spectre_music(1:end-1).*Hpass;
sig_filtred= ifft(y_filtre,"symmetric");

semilogx(f(1:floor(N/2)),abs( H(1:floor(N/2))),'linewidth',1.5)
legend("module de la transmittance complexe"); 
xlabel("f");
ylabel("|H(jw)|");



plot(fshift(1:end-1),fftshift(abs(fft(sig_filtred))))
legend("spectre du signal aprés filtrage"); 
xlabel("f");
ylabel("A");



 
 
