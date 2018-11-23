% Votre algorithme pour résoudre 
% 
%   min_{0 <= xprime <= 1} ||A*xprime - yprime||_1 

function [xprime,extra] = votrealgorithme(A,yprime,bool,n,m)




%dim C =(2*m + 2*n, m + n);
N = eye(n);
M = eye(m);
B = zeros (n,m);
C = [N, B ; -N, B; A, M ; -A, M];

%Matrice de contraintes

%dim c =(2*m + 2*n, 1);
c = [zeros(n,1); zeros(n,1)-1; yprime; -yprime];

%Vecteur de contraintes



for i = 1: 2*m + 2*n
  ctype(i)="L";
endfor
%Pour chaques contraintes; le type est >=


%dim f = zeros (n + m,1);

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
  %cas de résolution continue (relaxation)
  for i = 1 : n + m
    vtype(i) = "C";
  endfor
endif

if bool > 0
  %cas de résolution entière
  for i = 1 : n + m
    
    if i <=n
      vtype(i) = "I";
    endif
    
    if i>n
      vtype(i)="C";
    endif
    
  endfor
  
endif

[xprime, fmin,errnum, extra] = glpk (f, C, c, [], [], ctype, vtype, 1);


%xprime = zeros(size(A,2),1); % solution triviale