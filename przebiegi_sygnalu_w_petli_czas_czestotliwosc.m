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
    
    monoL=y(45:length(y),1);
    t=linspace(0,length(monoL)/fs,length(monoL));
    nfft=4096*3;
    f=linspace(0,fs,nfft);
    g=fft(monoL,nfft);
    valueDBFS=20*log10(abs(g)/max(g));

    figure(1); hold on
    subplot(3,2,plotidx)
    plot(t, monoL,'k','LineWidth',1);
    xlabel('Czas [s]')
    ylabel('Amplituda')
    xlim([0 0.005]);
    ylim([-1 1]);
        bx = gca;
    bx.XAxis.Exponent = 0;
    plotidx = plotidx+1

    subplot(3,2,plotidx)
    
    plot(f(1:nfft/2),valueDBFS(1:nfft/2),'k');
    xlabel('Częstotliwość [Hz]')
    ylabel('Amplituda [dBFS]')
    xlim([0 20000])
    ax = gca;
    ax.XAxis.Exponent = 0;
    plotidx= plotidx +1
   
end
