%% clear
clc;
clear all;
close all;

%% define
n = 0:49;
f1 = 0.05;
f2 = 0.03;
a = 2;
b = 3;
x1 = sin(2*pi*f1*n);
x2 = sin(2*pi*f2*n);
x3 = a*x1 + b*x2;
x5 = [zeros(1, 10),  x1(1:length(x1)-10)];

%% inputs
num = input('Enter numerator : ');
den = input('Enter denominator : ');

%% process
y1 = filter(num,den,x1);
y2 = filter(num,den,x2);
y3 = filter(num,den,x3);
y5 = filter(num,den,x5);
y4 = a*y1+b*y2;
y6 = [zeros(1,10),  y1(1: length(y1)-10)];

%% plot/output
% x1 & x2
subplot(4, 2, 1);
stem(x1);
title('x1');
grid on;
subplot(4, 2, 2);
stem(x2);
title('x2');
grid on;

% y1 & y2
subplot(4, 2, 3);
stem(y1);
title('y1');
grid on;
subplot(4, 2, 4);
stem(y2);
title('y2');
grid on;

% for linearity
subplot(4, 2, 5);
stem(y3);
title('Response of (a*x1 + b*x2)');
grid on;
subplot(4, 2, 7);
stem(y4);
title('a*y1+b*y2');
grid on;

% for shift-invariance
subplot(4, 2, 6);
stem(y5);
title('Generated y(n-k) from x1, with 10 shifts');
grid on;
subplot(4, 2, 8);
stem(y6);
title('y(n-k) from y1, with 10 shifts');
grid on;