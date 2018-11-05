% Votre algorithme pour résoudre 
% 
%   min_{0 <= xprime <= 1} ||A*xprime - yprime||_1 

function xprime = votrealgorithme(A,yprime)
a = size (A);
n = a(2);
m = a(1);
B = zeros(2*m, n);
b = zeros(2*m, 1);
I = eye (n);
B = [-A; A];
I2 = zeros (n,1);
c = I2 + 1;
b = [-yprime;yprime];

for i = 1: 2*m 
  ctype(i)="L";
endfor

for i = 1:n
  vtype(i)="I";
  lb(i)= 0;
  ub (i)= 1;
  endfor


[xprime, fmin,errnum, extra] = glpk (c, B, b,lb,ub, ctype, vtype, 1);
fprintf('%f\n', xprime);
fprintf('%f\n', errnum);


%xprime = zeros(size(A,2),1); % solution triviale