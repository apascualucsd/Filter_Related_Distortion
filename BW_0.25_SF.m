h1=sqrt_nyq_x(4, 0.25, 6, 1);
h1=h1/max(h1);
x0=(floor(2*rand(1,500))-0.5)/0.5+1j*(floor(2*rand(1,500))-0.5)/0.5;
x1=zeros(1,2000);
h2=reshape([h1 zeros(1,7)],4,14);
reg=zeros(1,14);

hh= h1/(h1*h1');

m=0;
for n=1:500
reg=[x0(n) reg(1:13)];
for k=1:4
    x1(k+m)=reg*h2(k,:)';
end
m=m+4;
end %1 to 4 interpolated version of x0

x2= conv(x1,hh);

figure(5)
subplot(2,2,1)
plot(0,0)
hold on
for n=1:8:2000-8
    plot(-1:1/4:+1,real(x2(n:n+8)),'b','linewidth',1.5)
end
hold off
grid on
title('Eye Diagram')
xlabel('Time Index')
ylabel('Amplitude')

subplot(2,2,3)
plot(x2(1:4:2000))
hold on
plot(x2(1:4:2000),'r.')
hold off
grid on
axis([-1.5 1.5 -1.5 1.5])
axis('square')
title('Constellation and Transition Diagram')
xlabel('Real (In Phase)')
ylabel('Imaginary (Quadrature)')

subplot(2,2,4)
plot(x2(1:4:2000),'r.')
grid on
axis([0.9 1.1 0.9 1.1])
axis('square')
title('Constellation')
xlabel('Real (In Phase)')
ylabel('Imaginary (Quadrature)')
