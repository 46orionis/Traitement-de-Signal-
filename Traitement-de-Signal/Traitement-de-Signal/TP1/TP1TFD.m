clear all
close all
clc

%realiser par Nilam 


%declaration des variables 
    fe = 1e4;
    te = 1/fe;
    N  = 10000;
    t  = (0:N-1)*te; 
    x  = 1.2*cos(2*pi*440*t+1.2)+3*cos(2*pi*550*t)+0.6*cos(2*pi*2500*t);
    f = (0:N-1)*(fe/N);
    y = fft(x);

%representation du spectre du signal x Transformé de Fourier
    plot (f, abs(y))%on peut remarqué lors de la reperesentation que le spectre est centré en  fe/2
    legend("y=fft(x)");
    xlabel("f");
    ylabel("A");
    %on crée la variable fshift qui permet de centré les valeurs fréquence de centré à la fréquence zéro. 
    fshift = (-N/2:N/2-1)*(fe/N);
   % le fftshift permet de faire la transformé de fourier et de  centré à la fréquence zéro. 
    z = fftshift(x);
   %on represente le spectre d'amplitude  centré à la fréquence  zéro.
    plot(fshift,fftshift(2*abs(y)/N));
    legend("Spectre d'Amplitude centré en 0");
    xlabel("f");
    ylabel("A");
    
% On ajoute un bruit blanc gaussien au signal x
    bruit = 2*randn(size(x));%creation du bruit blanc gaussien de faible intensité
    xbruit = x+bruit;%on l ajoute au signal x
    ybruit = fft(xbruit);%transformé de fourier du signal bruité 
    %on represente le spectre d'amplitude du signal bruité avec un bruit blanc gaussien de faible intensité
    plot(fshift,fftshift(2*abs(ybruit)/N))
    xlabel("f");
    ylabel("A");
    
% On ajoute un bruit avec une amplitude de 2 au signal originel 

    superbruit = 50*randn(size(x));%creation du bruit blanc gaussien de haute intensité
    xsuperbruit = x+superbruit;%on l ajoute au signal x
    ysuperbruit = fft(xsuperbruit);%transformé de fourier du signal bruité 
     %on represente le spectre d'amplitude du signal bruité avec un bruit blanc gaussien de forte intensité
    plot(fshift,fftshift(2*abs(ysuperbruit)/N))
%Representation des Signaux avec leur spectre
hold on

subplot(3,2,1) 
    plot(t,x,'.')
    legend("Signal x(t)")
    xlabel("t");
    ylabel("x(t)");
subplot(3,2,2) 
    plot(fshift,fftshift(2*abs(y)/N))
    legend("Spectre d'amplitude de x(t)")
    xlabel("f");
    ylabel("A");
subplot(3,2,3) 
    plot(t,xbruit,'.')
    legend("Signal x(t) bruité avec un bruit faible")
    xlabel("t");
    ylabel("x(t)");
subplot(3,2,4) 
    plot(fshift,fftshift(2*abs(ybruit)/N))
    legend("Spectre de x(t) bruité avec un bruit faible")
    xlabel("f");
    ylabel("A");
subplot(3,2,5) 
    plot(t,xsuperbruit,'.')
    legend("Signal x(t) bruité avec un bruit fort")
    xlabel("t");
    ylabel("x(t)");
subplot(3,2,6) 
     plot(fshift,fftshift(2*abs(ysuperbruit)/N))
      legend("Spectre de x(t) bruité avec un bruit fort")
      xlabel("f");
      ylabel("A");

      
  sound(x,fe)
  sound(xbruit,fe)
%  sound(xsuperbruit,fe)






