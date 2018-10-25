clc
clear all
fc1=input('Enter the Freq of the 1st Sine Wave Carrier: ');
fc2=input('Enter the Freq of the 2nd Sine Wave Carrier: ');
fp=input('Enter the Freq of Periodic Binary Pulse Message: ');
amp=input('Enter the Amplitude (For both Carrier and Binary Pulse Message: ');

t=0:0.001:1;
c1=amp.*sin(2*%pi*fc1*t);
c2=amp.*sin(2*%pi*fc2*t);

subplot(4,1,1);
xlabel('Time')
ylabel('Amplitude')
title('Carrier 1 Wave')
plot(t,c1);

subplot(4,1,2);
xlabel('Time')
ylabel('Amplitude')
title('Carrier 2 Wave')
plot(t,c2);

m=amp*squarewave(2*%pi*fp*t)+amp;

subplot(4,1,3);
xlabel('Time')
ylabel('Amplitude')
title('Binary Message Pulses')
plot(t,m);

for i=0:1000
    if m(i+1)==0
        mm(i+1)=c2(i+1);
    else
        mm(i+1)=c1(i+1);
    end
end

subplot(4,1,4);
xlabel('Time')
ylabel('Amplitude')
title('Modulated Wave')
plot(t,mm);
