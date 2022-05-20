% S1 - 2022
% The University of Adelaide
% ELEC ENG 2101-2105 
% Workshop - Week 2, Wednesday

clear all
close all
clc

%---------------------------
% plot magnitude
R=1000;         % in Ohms
L=0.159;        % in H
f=0:25:10000;   % in Hz
w=2*pi*f;       % in rad/s
figure;         % creating a new figure
subplot(2,1,1); % defining the first subplot within the figure

%%%%%%%%%%%%%%%%%%%%
% CHOOSING normal or cdB amplitude
% h=abs((1i*w*L)./(R+1i*w*L));  % magnitude in none-dB term
h=20*log10(abs((1i*w*L)./(R+1i*w*L))); % magnitude in dB

%%%%%%%%%%%%%%%%%%%%
% CHOOSING LINEAR OR LOG SCALE
% plot(w,h);      % no log scale on the x axis
semilogx(w,h);  % creating a log scale on the x-axis
grid on
title('$\left| TF \right|$','Interpreter','latex')
xlabel('$\log\omega$','Interpreter','latex')
ylabel('$\left| TF\left(j\omega\right) \right|$','Interpreter','latex')


%---------------------------
% plot cut-off frequency - amplitude plot
w_cutoff = R/L;     % in rad/s
hold on;
plot(w_cutoff , 20*log10(1/sqrt(2)),'o','MarkerFaceColor','red')


%---------------------------
% plot phase
theta=angle((1i*w*L)./(R+1i*w*L));
subplot (2,1,2);
degree=theta*180/pi; % converting to degree

%%%%%%%%%%%%%%%%%%%%
% CHOOSING LINEAR OR LOG SCALE
% plot(w,degree);     % no log scale on the x axis
semilogx(w,degree); % creating a log scale on the x-axis
grid on
title('$\angle{TF}$','Interpreter','latex')
xlabel('$\log\omega$','Interpreter','latex')
ylabel('$\angle TF(j\omega)$','Interpreter','latex')


%---------------------------
% plot cut-off frequency - phase plot
w_cutoff = R/L;     % in rad/s
hold on;
plot(w_cutoff , atan(R/w_cutoff/L)*180/pi,'o','MarkerFaceColor','red')


%% Second approach using MATLAB BODE function
%  TF = sL / (sL+R)
syms s
n=[L 0]; % numerator
d=[L R]; % denominator
g=tf(n,d);
figure;
bode(g);
grid on

