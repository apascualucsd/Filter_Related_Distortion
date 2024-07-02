h1=sqrt_nyq_x(4, 0.5, 6, 1);
h1=h1/max(h1);
x0=(floor(2*rand(1,500))-0.5)/0.5+1j*(floor(2*rand(1,500))-0.5)/0.5;
x1=zeros(1,2000);
h2=reshape([h1 zeros(1,7)],4,14);
reg=zeros(1,14);

m=0;
for n=1:500
reg=[x0(n) reg(1:13)];
for k=1:4
    x1(k+m)=reg*h2(k,:)';
end
m=m+4;
end %1 to 4 interpolated version of x0

[bb2,aa2]=cheby1(5,0.1,0.46); 
[H,W] = freqz(bb2,aa2,256,'whole');
fh=fftshift(20*log10(abs(H)));

x2 = filter(bb2,aa2,x1);
offset = 2; 
figure(8)
subplot(3,1,1)
plot(fh,'linewidth',2)
grid on
axis([0 250 -200 0])
title('Frequency Response')
xlabel('Frequency')
ylabel('Magnitude')

subplot(3,1,2)
x=[1 zeros(1,199)];
y=filter(bb,aa,x);
plot(0:50,y(1:51),'b','linewidth',2)
axis([0,50 -0.25 0.55])
grid on
title('Impulse Response, 5-th Order Cheby1 Low-Pass Filter')
xlabel('Time Index')
ylabel('Amplitude')

subplot(3,1,3)
plot(fh,'linewidth',2)
grid on
axis([80 180 -0.07 0.07])
title('In-Band Ripple Detail')
xlabel('Frequency, (kHz)')
ylabel('Log Mag (dB)')

figure(9)
subplot(2,2,1)
plot(0,0)
hold on
for n=1+offset:8:2000-8
    plot((-1:1/4:+1),real(x2(n:n+8)),'b','linewidth',1.5)
end
hold off
grid on
title('Eye Diagram')
xlabel('Time Index')
ylabel('Amplitude')

subplot(2,2,3)
plot(x2(1+offset:4:2000),'r.')
grid on
axis([-1.5 1.5 -1.5 1.5])
axis('square')
title('Constellation and Transition Diagram')
xlabel('Real (In Phase)')
ylabel('Imaginary (Quadrature)')

subplot(2,2,4)
plot(x2(1+offset:4:2000),'r.')
grid on
axis([0.99 1.01 0.99 1.01])
axis('square')
title('Constellation')
xlabel('Real (In Phase)')
ylabel('Imaginary (Quadrature)')
