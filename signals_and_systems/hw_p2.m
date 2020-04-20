% initial conditions
R = 2 * 10^6;
L = 1.5;

Us = [1; 3/(2*R); -1/R; 0; 0; 0; 0; 0];
Fi1 = [5; -1/R; 3/(2*R); 1/R; 0; -3/(2*R); 0; 0];
Fi2 = [-5; 0; 0; 0; 1/(2*R); -1/(2*R); 0; 0];
Fi3 = [0; 0; -1/(2*R); -1/R; -1/(2*R); 2/R; 1/R; 0];
It = [0; -1; -5; 0; 5; 0; 0; 0];
Ilp = [0; 0; 0; (-1*L)/R; 0; L/R; 0; 0];
I2lp = [0; 0; 0; 0; 0; 0; (2*L)/R; 0];
Il = [0; 0; 1; -1; 0; 0; 0; 0];
I = [0; 0; 0; 0; 0; 0; 0; 1];
Is = [0; 1; 0; 0; 0; 0; 0; 0];
I2l = [0; 0; 0; 0; 0; -1; 1; -1];

% calculation of state
M = [I2lp, Ilp, I, Fi1, Fi2, Fi3, Us, It];
N = [-1*I2l, -1*Il, -1*Is];

SVD = linsolve(M, N); % same as inv(M)*N
SVD = SVD(1:3, :);
A = SVD(1:2, 1:2);
Ct = SVD(3, 1:2);
D = SVD(3, 3);
B = SVD(1:2, 3);

% eigenvalues of A, manual check for asymptotical stability
la = eig(A);
disp(la);

E = eye(2);

% Lagrange matrices
L1=(A-la(2)*E)/(la(1)-la(2));
L2=(A-la(1)*E)/(la(2)-la(1));

% check?
%E - (L1 + L2)

K1=Ct*L1*B;
K2=Ct*L2*B;

% impulse response h(t) for t >= 0
h_func = @(t) K1.*exp(la(1).*t)+K2.*exp(la(2).*t);

% check for BIBO (< Inf)
integral(h_func, -1*Inf, Inf)


% plot impulse response and step funcion function
t=0:0.0000001:0.000001;
size_T = size(t);

tiledlayout(3,1) % Requires R2019b or later

h=stepfun(t,0).*(K1.*exp(la(1).*t)+K2.*exp(la(2).*t));

nexttile
plot(t,h)
title('Impulse response')

% my way of ploting g(t) function
% take integral of h(t) from 0 to t for each time point
S = ones(1, size_T(2));
for index = 1:1:size_T(2)
    S(index) = integral(h_func, 0, t(index));
end

nexttile
plot(t, S)
title('Step response (integral directly)')

% usual calculation of step response
al = D - K1/la(1) - K2/la(2);
g = stepfun(t, 0).*(al+(K1/la(1)).*exp(la(1).*t)+(K2/la(2)).*exp(la(2).*t));

nexttile
plot(t, g)
title('Step response (using K1, K2)')


