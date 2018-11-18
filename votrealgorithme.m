% Votre algorithme pour résoudre 
% 
%   min_{0 <= xprime <= 1} ||A*xprime - yprime||_1 

function [xprime,n] = votrealgorithme(A,yprime,bool)

a = size (A);
%dimensions matrice A dans vecteur a
n = a(2);
m = a(1);

%Dimensions de la matrice A

%C =(2*m + 2*n, m + n);
N = eye(n);
M = eye(m);
B = zeros (n,m);
C = [N, B ; -N, B; A, M ; -A, M];

%c =(2*m + 2*n, 1);
c = [zeros(n,1); zeros(n,1)-1; yprime; -yprime];

%Matrice de contrainte


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
if bool < 1
  for i = 1 : n + m
    vtype(i) = "C";
  endfor
endif
if bool > 0
  for i = 1 : n + m
    if i <=n
      vtype(i) = "I";
    endif
    if i>n
      vtype(i)="C";
    endif
  endfor
endif
%chaques variables est de type continue (vecteur de taille n+m soit nombre de variables pour cette relaxation)
[xprime, fmin,errnum, extra] = glpk (f, C, c, [], [], ctype, vtype, 1);
%fprintf('%f\n', xprime);
%fprintf('%f\n', errnum);

%xprime = zeros(size(A,2),1); % solution triviale