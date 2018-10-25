clc
clear all

fc=input('Enter the freq of Sine Wave carrier:');
fp=input('Enter the freq of Periodic Binary pulse(Message):');
amp=input('Enter the Amplitude (For Carrier & Binary Pulse Message:');
//pi=3.14;
t=0:0.001:1;
c=amp.*sin(2*%pi*fc*t);

subplot(3,1,1);
xlabel('Time')
ylabel('Amplitude')
title('Carrier Wave')
plot(t,c);

m=amp/2.*squarewave(2*%pi*fp*t)+(amp/2);

subplot(3,1,2);
xlabel('Time')
ylabel('Amplitude')
title('Binary Message Pulses')
plot(t,m);

w=c.*m;

subplot(3,1,3);
xlabel('Time')
ylabel('Amplitude')
title('Amplitude Shift Sign')
plot(t,w);
