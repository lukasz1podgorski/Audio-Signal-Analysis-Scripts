clear
clc
close

files = dir('sigs/*.wav') ; 
N = length(files) ; 

plotidx = 1;

figure('Position', [100, 100, 400, 400])
axes
axis('square')

for i = 1:N
    thisfile = files(i).name ; 
    [y, fs] = audioread(thisfile);
    
    monoL=y(:,1);
    t=linspace(0,length(monoL)/fs,length(monoL));
    nfft=4096*3;
    f=linspace(0,fs,nfft);
    g=fft(monoL,nfft);
    valueDBFS=20*log10(abs(g)/max(g));

    figure(1); hold on
    
    subplot(1,1,plotidx)
    
    spectrogram(monoL,hanning(8192),8000,8192,fs,'yaxis')
    xlabel('Czas [s]')
    ylabel('Częstotliwość [kHz]')
    a = colorbar;
    a.Label.String = 'Amplituda [dB]';
    a.Label.FontSize = 12;
    
    plotidx = plotidx +1;
end