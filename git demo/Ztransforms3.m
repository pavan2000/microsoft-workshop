clc
clear
close all
%%
n=linspace(-5,5);
X1=power(1/2,n);
X1(n<0)=0;
X2=power(3,n);
X2(n>0)=0;
X=X1+X2;
figure(1)
subplot(1,3,1)
stem(n,X1);
title('right hand seq');
subplot(1,3,2)
stem(n,X2);
title('left hand seq');
subplot(1,3,3)
stem(n,X);

Num1=[-1,0];
Num2=[1,0];
Den1=[1,-3];
Den2=[1,-1/2];
ts=0.1;
Xz1 =tf(Num1,Den1,ts);
Xz2 =tf(Num2,Den2,ts);
Xz=Xz1+Xz2;
[z,p,k] = tf2zp([-2.5,0],[1,-3.5,1.5]);
Zeros=z;
poles=p;
t=[0,0];
r1 = 0.5;
r2 = 3;
theta = 0 : 0.01 : 2*pi;
x1 = r1 * cos(theta) ;
boundary1 = r1 * sin(theta) ;
x2 = r2 * cos(theta) ;
boundary2 = r2 * sin(theta) ;

figure(2)
stem(p,t,'*');
hold on
grid on
stem(z,t(1));
plot(x1,boundary1);
plot(x2,boundary2);
legend('poles','zeros','boundary1','boundary2')
xlim([-5.5 5.5]);
ylim([-5.5 5.5]);
hold off

