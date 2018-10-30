clc
clear all

M = 16;
k = log2(M);
n = 3e4;
nSyms = n/k;

hMod = modem.qammod(M);
hMod.InputType = 'Bit';
hMod.SymbolOrder = 'Gray';
hDemod = modem.qamdemod(hMod);

x = randi([0 1],n,1); % Random binary data stream
tx = modulated(hmod,x);

EbNo = 0:10; % In db 
SNR = EbNo + 10*log10(k);

rx = zeros(nSyms,length(SNR));
bit_error_rate = zeros(length(SNR),1);
for i=1:length(SNR)
    
    rx(:,1) = awgn(tx,SNR(i),'measured');
end    
    rx_demod = demodulated(hDemod,rx);
    for i=1:length(SNR)
        [~,bit_error_rate(i)] = biterr(x,rx_demod(:,i));
end
 
 
theoryBer = 3/(2*k)*erfc(sqrt(0.1*k*(10.^(EbNo/10))));
figure;
semilogy(EbNo,theoryBer,'-',EbNo, bit_error_rate, '^-');
grid on;
legend('Theory BER','simulation');
xlabel('Eb/No',dB);
ylabel('Bit Error Rate');
title('Bit error probability curve for 16-QAM modulation');
