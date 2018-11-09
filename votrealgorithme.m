% Votre algorithme pour résoudre 
% 
%   min_{0 <= xprime <= 1} ||A*xprime - yprime||_1 

function [xprime] = votrealgorithme(A,yprime)

a = size (A);
n = a(2);
m = a(1);
%Dimensions de la matrice A

C = zeros(2*m + 2*n, m + n);
N = eye(n);
M = eye(m);
B = zeros (n,m);
C = [N, B ; -N, B; A, M ; -A, M];

c = zeros(2*m + 2*n, 1);
c = [zeros(n,1); zeros(n,1)-1; yprime; -yprime];

%Matrice de contrainte
%I = eye (n);

for i = 1: 2*m + 2*n
  ctype(i)="L";
endfor
%Pour chaques contraintes; le type est >=


f = zeros (n + m,1);

for i = 1: n+m
  
  if i <= n
    f(i) = 0;
  endif
  
  if i > n
    f(i) = 1;
  endif
  
endfor

%Coefficients fonction objectif

for i = 1 : n + m
  vtype(i)="C";
endfor

[xprime, fmin,errnum, extra] = glpk (f, C, c, [], [], ctype, vtype, 1);
%fprintf('%f\n', xprime);
%fprintf('%f\n', errnum);

%xprime = zeros(size(A,2),1); % solution triviale