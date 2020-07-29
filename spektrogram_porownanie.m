clear
clc
close

[y,fs]=audioread('delayfilterresponsewhitenoise2.wav');
[y1,fs1]=audioread('adirakkkk.wav');

monoL=y(:,1);
monoR=y(:,2);
mono1=y1(:,1);


t=linspace(0,length(monoL)/fs,length(monoL));
t1=linspace(0,length(mono1)/fs1,length(mono1));
nfft=8192;
f=linspace(0,fs,nfft);
g=fft(monoL,nfft);
valueDBFS=20*log10(abs(g)/max(g));


figure
    
subplot(2,1,1)

spectrogram(mono1,hanning(8192),8000,8192,fs1,'yaxis')
xlabel('Czas [s]')
ylabel('Częstotliwość [kHz]')
a = colorbar;
a.Label.String = 'Amplituda [dB]';
a.Label.FontSize = 12;
caxis([-160 -110]);


subplot(2,1,2)

spectrogram(monoL,hanning(8192),8000,8192,fs,'yaxis')
xlabel('Czas [s]')
ylabel('Częstotliwość [kHz]')
a = colorbar;
a.Label.String = 'Amplituda [dB]';
a.Label.FontSize = 12;
