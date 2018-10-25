clc
clear all
t=0:0.001:1;
fc=input('Enter the freq of Sine Wave carrier: ');
fm=input('Enter the freq of Message signal: ');
amp=input('Enter the Amplitude of For Carrier & Message (Assuming then as equal): ');

c=amp.*sin(2*%pi*fc*t);

subplot(3,1,1);
xlabel('Time')
ylabel('Amplitude')
title('Carrier Wave')
plot(t,c);

m=squarewave(2*%pi*fm*t);

subplot(3,1,2);
xlabel('Time')
ylabel('Amplitude')
title('Message')
plot(t,m);

x=c.*m;

subplot(3,1,3);
xlabel('t')
ylabel('y')
title('PSK')
plot(t,x);
