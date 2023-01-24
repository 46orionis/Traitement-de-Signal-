clear all
close all
clc

%realiser par Nilam 

%Déclaration des variables
    fe = 1e4;
    te = 1/fe;
    N  = 5000;
    t  = (0:N-1)*te; 
    x  = 1.2*cos(2*pi*440*t+1.2)+3*cos(2*pi*550*t)+0.6*cos(2*pi*2500*t);
    x1  = 1.2*cos(2*pi*440*t+1.2)+3*cos(2*pi*550*t);
    f = (0:N-1)*(fe/N);
    y = fft(x);
    fshift = (-N/2:N/2-1)*(fe/N);


% Conception du filtre pass bas

    fc = 2000;
    pass_bas = zeros(size(x));
    index_fc = ceil((fc*N)/fe);
    pass_bas(1:index_fc) = 1;
    pass_bas(N-index_fc+1:N) = 1;


%Application du filtre 
    x_filtre_freq = pass_bas .*y;
    x_filtre_temp = ifft(x_filtre_freq,"symmetric");


% representation 
    subplot(2,3,1)
    plot(t,x,"Linewidth",1.5)
    legend("Signal d'origine")
    xlabel("t");
    ylabel("x(t)");
    
    subplot(2,3,2)
    plot(fshift,fftshift(abs(y)));
    legend("spectre du signal d'origine")
    xlabel("f");
    ylabel("A");
    
    subplot(2,3,3)
    plot(f,pass_bas,"Linewidth",1.5)
    legend("Filtre pass bas")
    xlabel("f");
    ylabel("Filtre");

    subplot(2,3,4)
    plot(t,x_filtre_temp);
    xlabel("t");
    ylabel("Signal x filtrer ");
    legend(" signal filtrer")
    
    subplot(2,3,5)
    plot(fshift,fftshift(abs(fft(x_filtre_temp))));
    xlabel("f");
    ylabel("A");
    legend("spectre du signal filtrer");
    
    subplot(2,3,6)
    plot(t,x1-x_filtre_temp);
    legend("la différence entre le signal filtre et le signal sans le cosinus de frequence 2500");
    xlabel("t");
    ylabel("différence");
    
   


