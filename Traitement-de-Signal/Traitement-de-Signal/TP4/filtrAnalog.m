clear all 
close all
clc
%realiser par : Nilam

f1 = 500;
f2 = 400;
f3 = 50;
Te = 0.001 ;
t = [0:Te:5];
fe = 1/Te;
N = length(t);
fshift = (-N/2:(N/2)-1)*(fe/N);
K = 1;
Wc = 50;


x= sin(2*pi*f1*t)+sin(2*pi*f2*t)+sin(2*pi*f3*t);

subplot(2,2,1)
    plot(t,x);
    legend(" Signal x avec T =0.001");
    xlabel("t");
    ylabel("x(t)");

subplot(2,2,3)
    y = fft(x);
    plot(fshift,fftshift(abs(y)));
    legend(" Spectre du signal x avec T =0.001");
    xlabel("f");
    ylabel("A");


subplot(2,2,2)
    Te2 = 0.0005 ;
    fe2 = 1/Te2;
    t2 = [0:Te2:5];
    x2 = sin(2*pi*f1*t2)+sin(2*pi*f2*t2)+sin(2*pi*f3*t2);
    N2 = length(t2);
    fshift2 = (-N2/2:(N2/2)-1)*(fe2/N2);

    plot(t2,x2);
    legend(" Signal x avec T =0.0005");
    xlabel("t");
    ylabel("x(t)");

subplot(2,2,4)
    y2 = fft(x2);
    plot(fshift2,fftshift(abs(y2)));
    legend(" Spectre du signal x avec T =0.0005");
    xlabel("f");
    ylabel("A");
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    

