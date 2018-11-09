% Projet d'optimisation non linéaire
%
% Décodez le message d'Alice... 

clear all; clc; 
addpath ('C:/Inge/avoir/opti/lin/Messages');
% load la matrice d'encodage et le message d'Alice transmis par le canal: 
load ('messagedAlice.mat'); 

a = size (A);
n = a(2);
m = a(1);

% Utilisez votre algorithme pour résoudre:
% 
%   min_{0 <= xprime <= 1} ||A*xprime - yprime||_2^2 
%
% Rem. La solution xprime devrait être un vecteur de taille 98x1
[xprime] = votrealgorithme(A,yprime);
 


for i= 1:n
  xprime (i) = round (xprime(i));
  xp(i)=xprime(i);
endfor

% Affichez le résultat: 
fprintf('The recovered message is: %s \n', decoding_bin(xp,d)); 