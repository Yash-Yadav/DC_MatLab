clc
clear all
data=[0 101110011];
//Number_of_bit=1024;
//data=randint(Number_of_bit, 1);
figure (1)
stem(data,'linewidth', 3); grid on;
title('Information before Transmiting');
axis([0 11 0 1.5]);

data_NZR=2*data-1;
s_p_data=reshape(data_NZR,2,length(data)/2);

br=10.^6;
f=br ;
T=l/br;

// Here goes QPSK Modulation
//xxxxxxxxxxxxxxxxxxxxxxxxxx

y=[];
y_in=[];
y_qd=[];
for(i=1 : length(data)/2)
    yl=s_p_data(1,i)*cos(2*pi*f*t);
    y2=s_p_data(2,i)*sin(2*pi*f*t);
    y_in=[y_in yl];
    y_qd=[y_qd y2];
    y=[y yl+Y2];
end

Tx_sig=y;
tt=T/99:T/99:(T*length(data))/2;
figure(2)

Subplot(3,1,1);
plot(tt,y_in,'linewidth',3); grid on;
title('Wave form for inphase component in QPSK modulation');
xlabel('Time(sec)');
ylabel('Amplitude(Volt0');

subplot(3,1,2);
plot(tt,yqd,'linewidth',3); grid on;
title('Wave form for Quadrature component in QPSK modulation');
xlabel('Time(sec)');
ylabel('Amplitude(Volt0');

subplot(3,1,3);
plot(tt,Tx_sig,'r','linewidth',3), grid on;
title('QPSK modulated signal (Sum of inphase and Quadrature phase signal)');
xlabel('Time(sec)');
ylabel('Amplitude(Volt0');

// Here goes QPSK demodulation
//xxxxxxxxxxxxxxxxxxxxxxxxxxxx

Rx_data=[];
Rx_sig=Tx_sig;
for(i=l:1:length(data)/2)
    //inphase coherent dector XXXXXXX
    Z_in=Rx_sig((i-1)*length(t)+1:i*length(t)).*cos(2*pi*f*t);
    Z_in_intg=(trapz(t,Z_in))*(2/T);
    if (Z_in_intg>0)
        Rx_in_data-1;
    else
        Rx_in_data=0;
    end
    //Quadrature coherent dector XXXXXX
    Z_qd=Rx_sig((i-1)*length(t)+1:i*length(t)).*sin(2*pi*f*t);
    Z_qd_intg=(trapz(t,Z_qd))*(2/T);
    if (Z_qd_intg>0)
        Rx_qd_data=1;
    else
        Rx_qd_data=0;
    end
end

    Rx_data=[Rx_data Rx_in_data Rx_qd_data];
    figure (3)
    stem (Rx_data,'linewidth',3)
    title('Information after Receiveing');
    axis([ 0 11 0 1.5]), grid on;
