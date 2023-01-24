clear all 
close all
clc


%realiser par : Nilam
%la fct AudioRead prend comme entré l 'enregistrement  et nous donne en le
%signal x du signale la fréquence d'échantillonage avec laquelle le signal
%a été enregistré
[x,fs] = audioread("bluewhale.au");
%On a pris juste la partie du signal qu'on va traité la ou il y a le chant
%la rorquale bleu
chant = x(2.45e4:3.10e4);
taille = length(chant);
ts = 1/fs;
t = (0:taille-1)*(10*ts);
fshift = (-taille/2:taille/2-1)*(fs/taille);

Chant2 = x(2e2:4.0229e4);
Taille = length(Chant2);
T = (0:Taille-1)*(10*ts);
fshift2 = (-Taille/2:Taille/2-1)*(fs/Taille);


%On applique la transformation de fourier rapide sur le chant 
Schant = fft(chant);
%Densité spectrale du Chant
Densite_spectrale_chant = abs(Schant).^2/taille;


%On applique la transformation de fourier rapide sur le chant 
Schant2 = fft(Chant2);
%Densité spectrale du Chant lorsqu on a augementé la taille de l echantillon
Densite_spectrale_chant2 = abs(Schant2).^2/taille;





subplot(2,3,1)
sound(chant,fs);
plot(t,chant);
legend("representation du signal Chant");
xlabel("t");
ylabel("chant");

subplot(2,3,2)
plot(fshift,fftshift(2*abs(Schant)/taille));
legend("representation du spectre u signal Chant");
xlabel("Fréquence (Hz)");
ylabel("A");


subplot(2,3,3)
f = (0:floor(taille/2))*(fs/taille)/10;
plot(f,Densite_spectrale_chant(1:floor(taille/2)+1));
legend("Densité spectrale du chant");
xlabel("Fréquence (Hz)");
ylabel("Densité spectrale en puissance");


subplot(2,3,4)
sound(Chant2,fs);
plot(T,Chant2);
legend("representation du signal Chant 2");
xlabel("t");
ylabel("chant 2");

subplot(2,3,5)
plot(fshift2,fftshift(2*abs(Schant2)/Taille));
legend("representation du spectre en Amplitude du signal Chant 2");
xlabel("Fréquence (Hz)");
ylabel("A");


subplot(2,3,6)
f = (0:floor(Taille/2))*(fs/Taille)/10;
plot(f,Densite_spectrale_chant2(1:floor(Taille/2)+1));
legend("Densité spectrale du chant 2");
xlabel("Fréquence (Hz)");
ylabel("Densité spectrale en puissance");


