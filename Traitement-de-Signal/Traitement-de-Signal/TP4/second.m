    clear all 
    close all
    clc
%realiser par : Nilam

f1 = 500;
f2 = 400;
f3 = 50;
fc0 = 50;
Te = 0.0005;
t = [0:Te:5-Te];
fe = 1/Te;
N = length(t);
f = (0:N-1)*fe/N;
fshift = (-N/2:(N/2)-1)*(fe/N);
K = 1;
wc = 50;
w = 2*pi*f;


x = sin(2*pi*f1*t)+sin(2*pi*f2*t)+sin(2*pi*f3*t);
y = fft(x);


% subplot(3,2,2)
%     plot(t,x);
%     legend(" Signal x avec T =0.0005");
subplot(2,2,2)
    plot(fshift,fftshift(abs(y)));
    legend(" Spectre du signal x avec T =0.0005");
    xlabel("f");
    ylabel("A");
    
%% Transmitance Complexe
    % frequence wc=50
    H = (K*1i*w/wc)./(1+1i*w/wc);
    G = 20*log(abs(H));
    Ang = angle(H);
    
    % 1 frequence fc=500
    wc1=2*pi*500;
    H1 = (K*1i*w/wc1)./(1+1i*w/wc1);
    G1 = 20*log(abs(H1));
    Ang1 = angle(H1);
    
    % 2 frequence fc=1000
    wc2=2*pi*1000;
    H2 = (K*1i*w/wc2)./(1+1i*w/wc2);
    G2 = 20*log(abs(H2));
    Ang2 = angle(H2);
    
    % 3 frequence fc=150
    wc3=2*pi*150;
    H3 = (K*1i*w/wc3)./(1+1i*w/wc3);
    G3 = 20*log(abs(H3));
    Ang3 = angle(H3);
    
    %representation des spectres leur Gain et le dephasage et spectre filtrer
%     subplot(2,2,1);
%     
%         semilogx(f,abs(H),f,abs(H1),f,abs(H2),f,abs(H3));
%         legend("spectre du signal avec wc=50","spectre du signal avec wc1=2*pi*500"," spectre du signal avec wc2=2*pi*1000","spectre du signal avec wc3=2*pi*50");  
%         grid on
%         xlabel("f");
%         ylabel("|H(jw)|");
%     subplot(2,2,2);
%         semilogx(f,G,f,G1,f,G2,f,G3);
%         legend("Courbe de Gain  wc=50","Courbe de Gain wc1=2*pi*500","Courbe de Gain wc2=2*pi*1000","Courbe de Gain wc3=2*pi*50");  
%         grid on
%         xlabel("f");
%         ylabel("20*log(|H(jw)|)");
%     
%     subplot(2,2,3);
%     
%         semilogx(f,Ang,f,Ang1,f,Ang2,f,Ang3);
%         grid on
%         legend("Courbe de dephasage wc=50","Courbe de dephasage wc1=2*pi*500","Courbe de dephasage wc2=2*pi*1000","Courbe de dephasage wc3=2*pi*50"); 
%         xlabel("f");
%         ylabel("angle(H(jw))");
        
     subplot(2,2,1);
        Hpass=[H1(1:floor(N/2)),flip(H1(1:floor(N/2)))];
        filter_freq = y .* Hpass;
        filter_temp = ifft(filter_freq,"symmetric");
    
       plot(fshift,fftshift(2*abs(fft(filter_temp)/N)));
       legend("spectre de phase apres filtrage avec H1 fc=500");
        xlabel("f");
        ylabel("A");
       
%        %% Filtre ideale 
%         %creation du filtre
%             filtre_interferance = ones(N);
%             index_fc0 = ceil((fc0*N)/fe)+1;
%             filtre_interferance(index_fc0)=0;
%             filtre_interferance(N-index_fc0+1)=0;
% 
%     
%      %application du filtre
%             filtre_int_freq = y.* filtre_interferance ;
%  
%     %restitution du signal filtrer
%             filtre_int_temp = ifft(filtre_int_freq,"symmetric");  
%     
%     %Comparer filtrage ideal et reel
%             diff = filtre_int_temp - filter_temp ; 
%    
%       subplot(3,3,5)
%              plot(fshift,fftshift(2*abs(fft(filtre_int_temp))/N));
%       subplot(3,3,6)
%       
%             plot(t,diff,"Linewidth",1)
%             legend("difference entre filtrage reel et ideal")




