clear all 
close all
clc

%realiser par : Nilam

[x,fs]=audioread("phrase.au");

    Taille = length(x);
    ts=1/fs;
    T = (0:Taille-1)*ts;

%original sound and signal
    sound(x,fs);
    subplot(1,2,1)
    plot(T,x);
    legend("Representation du signal du son");
    xlabel("t");
    ylabel("x(t)");
    
%Ecoutez la phrase en modifiant la fréquence d’échantillonnage à double ou deux fois plus petite
    sound(x,1/7*fs);
    sound(x,2*fs);
    
%Spectre du signal 
    y=fft(x);
    Densite_spectrale_phrase = abs(y).^2/Taille;
    f = (0:floor(Taille/2))*(fs/Taille);
    subplot(1,2,2)
    plot(f,Densite_spectrale_phrase(1:floor(Taille/2)+1));
    legend("Representation du signal du son");
    xlabel("Fréquence (Hz)");
    ylabel("Densité spectrale en puissance");




%segmentation
       %first segmentation 'rien ne sert de'
        seg1 = x(1:130106);
        % sound(seg1,fs);

       %second segmentation 'courir'
        seg2=x(130107:190006);
        %sound(seg2,fs);
        
       %third segmentation 'il faut'
        seg3=x(190007:250006);
        %sound(seg3,fs);
        
       %4th segmentation 'partir a point'
        seg4=x(250007:394240);
        %sound(seg4,fs);

%réarrangé la phrase 
        sound([seg1;seg4;seg3;seg2],fs);
       
