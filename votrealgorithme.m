% Votre algorithme pour résoudre 
% 
%   min_{0 <= xprime <= 1} ||A*xprime - yprime||_1 

function xprime = votrealgorithme(A,yprime)
a = size (A);
n = a(2);
m = a(1);
B = zeros(2*m + 2*n, n);
b = zeros(2*m + 2*n, 1);
I = eye (n);
B = [I;-I;-A; A];
I2 = zeros (n,1);
c = I2 + 1;
b = [I2;I2-1;-yprime;yprime];

for i = 1: 2*m + 2*n
  s(i)="L";
endfor

for i = 1:n
  l(i)="C";
endfor



xprime = glpk (c, B, b,[],[], s, l, 1);
fprintf('%f\n', xprime);


%xprime = zeros(size(A,2),1); % solution triviale