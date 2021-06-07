# Control Engineering course

Matlab code snippets.

## Intro

```matlab
% for comment
% ; semicolon for end command
% clear all - cleal all workspace variables
% clc clear the Command Window

% eye(n) - identity matrix of size n
% zeros(m, n) - m x n zero matrix
% ones(m, n) - m x n one matrix
% rand(m, n) - m x n matrix with random values

% indexing starts from 1 (not zero like in normal languages)
% V = [1 2 3];
% M = [1 2; 3 4];
% V' - transpose;
% M(i, j) - i row index, j column index;
% eig(M) - eigen values
% det(M) - determinant
% length(M) - largest matrix dimension size
% size(M) - returns (number of rows, number of columns)

% Example 1:
A1 = [2, 2, 3; 7, 5, 4; 1, 1, 2];
b1 = [9, 6, 4];
P1 = A1*b1';
x1 = inv(A1)*b1';
% display(x1)

% Example 2:
% 3*x^4 + x^2 + 5*x + 2 => P = [3 0 1 5 2];
% polyval(P, a) - evaluate polymonial at x = a
% polyder(P) - derive poly P
% conv(P, Q) - multiply two poly P and Q
P2 = [3 0 1 5 2];
Q2 = [2 0.5 1];
R2 = [1 sqrt(3) 1];
product2 = conv(conv(P2, Q2), R2);
% display(product2);

% Example 3:
% loops
% for i = 1:1:10
% while (i <= 10)

% function creation
[a3, b3] = min_max([1 3 5 -2]);
function [vector_min, vector_max] = min_max(x)
    vector_min = x(1);
    vector_max = x(1);
    for i = 2:1:length(x)
        if x(i) > vector_max
            vector_max = x(i);
        end
        if x(i) < vector_min
            vector_min = x(i);
        end
    end
end
```

## Plots

```matlab
% Graph
x = 0:0.01:10;

y1 = sin(x);
y2 = cos(x);

figure(1);
plot(x, y1, 'r');
hold on;
plot(x, y2, 'g');
hold off;
legend('sine wave', 'cosine wave');
xlabel('axis x');
ylabel('axis y');
title('sine and cosine wave')

%subplot(1, 2, 1);
%plot(x, y1, 'r');
%subplot(1, 2, 2);
%plot(x, y2, 'g');
```

## Laplace transforms

```matlab
% F(s) = (4s+3)/(s^2(s+1)(4s+1)(10s+1))
% F(s) = r1/(s-p1) + r1/(s-p2) + ... + k(s)

% r - roots, p - poles, k - constant at the end
[r, p, k] = residue([4, 3], ...
    conv(conv(conv([4,1],[10, 1]), [1, 1]), [1, 0, 0]));
% result from r,p,k => F(s) = -0.037/(s+1) - 7.1111/(s+0.25) 
% + 48.1481/(s+0.1) - 41/s + 3/s^2 + k
```

## Transfer functions

```matlab
% tf(num, den) creates a transfer function with given coefficients of
% numerator and denominator

% Example 2: transfer function, W1(s) = 2/(s+10)
W1 = tf(2, [1, 10]);
poles_W1 = pole(W1);
zeros_W1 = zero(W1);
% or root(num)/root(den)

% state space
% sys = ss(A, B, C, D)
% sys = ss(W)
% [A, B, C, D] = tf2ss(num, den)
% charpoly(A) - characteristic polynomial

% can be this => W = C*((1/det(s*I-A))*adj(s*I-A))*B + D

% Example 3:
W3 = tf(2, [1, 1, 1]);
[A, B, C, D] = tf2ss(W3.Numerator{:}, W3.Denominator{:});

% Example 4:
% [num, den] = ss2tf(A, B, C, D)

% Example 5:
zeros = [2, 3];
poles = [-1-i, -1+i];
gain = 2; % k = 2
W_zpk = zpk(zeros, poles, gain);

% Example 6:
% [num, den] = zp2tf(zeros, poles, k)
% [A, B, C, D] = zp2ss(zeros, poles, k)

% Practice 4 - Exercise 3
A = [-0.5, 1, 0; 0, 0, 1; 0, 0, 0];
B = [0;0;1];
C = [1, 0, 0];
D = 0;

% 2)
eig(A)

% 3)
[num, den] = ss2tf(A,B,C,D);
W = tf(num, den);
pole(W)

% 4) poles/zeros plot
pzmap(W);

% Impulse and step response
impulse(W);
step(W);
ltiview({'step', 'impulse', 'pzmap'}, W);

% Damping factor and omega zero
[w0, xi] = damp(W);  % omega zero and damping factor
```

## Nyquist plot

```matlab
nyquist(Wo)
```

## System stability

WIP...

## P, PI, PD controllers (Practice 8)

```matlab
% P controller - Example 1 (desired Ap for P controller)
% find desired Ap so steady-state error is 0.1, e(inf) = 0.1
Wpl = tf(2, conv(conv([10 1],[4 1]), [1 1]));

% we found it during the practice e(inf) = 1/(1+K)
% K = A*Ap
Wc = 4.5; 

Wo = series(Wc, Wpl);
Wcl = feedback(Wo, 1, -1);
% step(Wcl); % check if calculationis correct

% P controller - Example 2
% design controller which results in damping factor of sqrt(2)/2 = 0.7071
Wpl = tf(2, [2 1 0]);

% find manually on graph damping factor of 0.7071, graph will show gain of
% 0.125, this is your answer
rlocus(Wpl)

% to check
Wc = 0.125;
Wo = series(Wc, Wpl);
Wcl = feedback(Wo, 1, -1);
% damp(Wcl);


% PD controller - Example 1 
% design controller which results in cross-over freq of 1 rad/sec

% cancelling second slowest, N = Td/Tc = 10 (default) => Tc = 4/11
Wpl = tf(2, conv(conv([10 1],[4 1]), [1 1]));
Wpd = tf([4 1], [4/11 1]);
Wo = series(Wpd, Wpl);
%[magnitude, ~] = bode(Wo, 1);
%Ap = 1/magnitude;
% check result
%margin(Wo*Ap);

% PD controller - Example 2 
% design controller with phase margin = 45 degrees

% A = 2, T1 = 1 sec, T2 = 2 sec
Wpl = tf(2, conv([1 0], [2 1]));
Wpd = tf([2 1], [2/11 1]);
Wo = series(Wpd, Wpl);

% Way 1 (manual)
% use margin(Wo) or bode(Wo) plots to manually find
% cross-over freq. corresponding to 45 degress (-135)
% in our case wc = 5.5 rad/s
%[magnitude, ~] = bode(Wo, 5.5);
%Ap = 1/magnitude;

% Way 2 (automatic, be careful)
[~, phase, wout] = bode(Wo);
phase = squeeze(phase);
% search for wc when margin is 45 degrees
wc = interp1(phase, wout, -135);
[magnitude, ~] = bode(Wo, wc);
Ap = 1/magnitude;


% PI controller - Example
% design controller with fast operation, phase margin = 45 deg
% and zero steady-state error

% PI ensures zero steady-state error, we do not need to anything
Wpl = tf(2, conv(conv([10 1], [4 1]), [1 1]));

% fast operation => cancel slowest pole = Ti = T1 = 10 sec
Wpi = tf([10 1], [10 0]);
Wo = series(Wpl, Wpi);

% Way 1
% find manually on a plot
% margin(Wo) or bode(Wo)

% Way 2 (auto)
[~, phase, wout] = bode(Wo);
phase = squeeze(phase);
wc = interp1(phase, wout, -135);
[magnitude, ~] = bode(Wo, wc);
Ap = 1/magnitude;
```

## PID controller

WIP...