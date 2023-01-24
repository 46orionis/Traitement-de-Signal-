clear all
close all
clc


%Declaration des variable
load('ecg.mat');
fe = 500;
N = length(ecg);
t = (0:N-1)*1/fe;
f=(0:N-1)*(fe/N);
fc = 0.5;
fc0 = 50;
fc1=40;

%[0.5;1.5] la taille d une periode
%%
%tarnsformer de fourier rapide 
y = fft(ecg);
fshift = (-N/2:N/2-1)*(fe/N);

%filtrage

   %creation du filtre pass haut
filtre_pass_Haut = ones(size(ecg));
index_fc = ceil((fc*N)/fe);
filtre_pass_Haut(1:index_fc) = 0;
filtre_pass_Haut(N-index_fc+1:N) = 0;

    %filtrage 
ecg_filtre_freq = filtre_pass_Haut .*y;

    %restitution du signal filtrer
 ecg_filtre_temp = ifft(ecg_filtre_freq,"symmetric");  
 
       %le bruit de bass frequence
 bruit= ecg-ecg_filtre_temp;
 
%% 
 %filtrage du bruit d'interferance
 
    %creation du filtre
    filtre_interferance = ones(size(ecg));
    index_fc0 = ceil((fc0*N)/fe)+1;
    filtre_interferance(index_fc0)=0;
    filtre_interferance(N-index_fc0+1)=0;
    
    %application du filtre
    ecg_filtre_int_freq = filtre_interferance .*fft(ecg_filtre_temp);
 
    %restitution du signal filtrer
    ecg_filtre_int_temp = ifft(ecg_filtre_int_freq,"symmetric");  
    
    bruit_inter = ecg_filtre_temp-ecg_filtre_int_temp; 
 
 
%%
%tarnsformer de fourier rapide 
y = fft(ecg);
fshift = (-N/2:N/2-1)*(fe/N);

%filtrage

   %creation du filtre pass haut
filtre_pass_Haut = ones(size(ecg));
index_fc = ceil((fc*N)/fe);
filtre_pass_Haut(1:index_fc) = 0;
filtre_pass_Haut(N-index_fc+1:N) = 0;

    %filtrage 
ecg_filtre_freq = filtre_pass_Haut .*y;

    %restitution du signal filtrer
 ecg_filtre_temp = ifft(ecg_filtre_freq,"symmetric");  
 
       %le bruit de bass frequence
 bruit= ecg-ecg_filtre_temp;
 
%% 
 %filtrage du bruit haute frequence
 
    %creation du filtre pass bas
    filtre_pass_bas = zeros(size(ecg));
    index_fc1 = ceil((fc1*N)/fe);
    filtre_pass_bas(1:index_fc1)=1;
    filtre_pass_bas(N-index_fc1+1:N)=1;
    
    %application du filtre
    ecg_filtre_bas_freq = filtre_pass_bas .*fft(ecg_filtre_temp);
 
    %restitution du signal filtrer
    ecg_filtre_bas_temp = ifft(ecg_filtre_bas_freq,"symmetric");  
    
    %bruit haute frequence
    bruit_haut = ecg_filtre_int_temp-ecg_filtre_bas_temp; 
 

%%    
    
% representation 

subplot(4,3,1)
plot(t,ecg,'linewidth',1)
xlim([0.5 1.5])
legend(" signal d'origine")
xlabel("t");
ylabel("ecg");

subplot(4,3,2)
plot(fshift,fftshift(abs(y)));
legend("spectre du signal d'origine")
xlabel("f");
ylabel("A");

subplot(4,3,3)

plot(t,bruit,'linewidth',1);
legend("bruit bass fréquence")
xlabel("t");
ylabel("bruit");
   


subplot(4,3,4)
plot(t,ecg_filtre_temp,'linewidth',1);
xlim([0.5 1.5])
legend("signal filtre")
xlabel("t");
ylabel("ecg1");
    

subplot(4,3,5)
plot(fshift,fftshift(abs(fft(ecg_filtre_temp))));
legend("spectre du signal filtrer ecg1")
xlabel("f");
ylabel("A");

subplot(4,3,6)
plot(t,bruit_inter,"Linewidth",1)
legend("bruit interferance")
xlabel("t");
ylabel("Bruit 50Hz");
    

subplot(4,3,7)
plot(t,ecg_filtre_int_temp,'linewidth',1);
legend(" signal filtrer interferance")
xlim([0.5 1.5])
xlabel("t");
ylabel("ecg2");
    

subplot(4,3,8)
plot(fshift,fftshift(abs(fft(ecg_filtre_int_temp))));
legend("spectre du signal filtrer ecg2")
xlabel("f");
ylabel("A");


subplot(4,3,9)
plot(t,bruit_haut,'linewidth',1);
legend("bruit haute Fréquence")
xlabel("t");
ylabel("bruit  ");
    

subplot(4,3,10)
plot(t,ecg_filtre_bas_temp,'linewidth',1);
xlim([0.5 1.5])
legend("signal filtre")
xlabel("t");
ylabel("ecg 3");
    


subplot(4,3,11)
plot(fshift,fftshift(abs(fft(ecg_filtre_bas_temp))));
legend("spectre du signal filtrer ecg3")
xlabel("f");
ylabel("A");





%%


% subplot(1,3,1)
% plot(f,filtre_pass_Haut,"Linewidth",1.5)
% legend("Filtre pass  haut")

% subplot(1,3,3)
% plot(f,filtre_interferance,"Linewidth",1.5)
% legend("Filtre interferance")

% subplot(4,3,12)
% 
% plot(t,bruit,'linewidth',1);
% legend("bruit")


%% Identification de la fréquence cardiaque avec la fonction d’autocorrélation 
subplot(4,3,12)
[c,lags] = xcorr(ecg_filtre_bas_temp,ecg_filtre_bas_temp);
 stem(lags/fe,c)




