% Votre algorithme pour résoudre 
% 
%   min_{0 <= xprime <= 1} ||A*xprime - yprime||_1 

function xprime = votrealgorithme(A,yprime)

% !!! Ecrivez votre code ici !!! 

xprime = zeros(size(A,2),1); % solution triviale