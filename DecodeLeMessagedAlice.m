% Projet d'optimisation non lin�aire
%
% D�codez le message d'Alice... 

clear all; clc; 
addpath ('C:/Inge/avoir/opti/lin');
% load la matrice d'encodage et le message d'Alice transmis par le canal: 
load ('messagedAlice.mat'); 

a = size(A);
n= a(2);
m = 4*n;
%valeurs n et m reprises
bool = 0;
% Utilisez votre algorithme pour r�soudre:
% 
%   min_{0 <= xprime <= 1} ||A*xprime - yprime||_2^2 
%
% Rem. La solution xprime devrait �tre un vecteur de taille 98x1
[xprime] = votrealgorithme(A,yprime,bool,n,m);
 




xprime = resize(xprime, n);
%virer les ti inutiles

for j= 1 : n 
    xp(j) = xprime(j);
    xp(j) = round (xp(j));
    %arrondir solution obtenue  
  endfor

% Affichez le r�sultat: 
fprintf('The recovered message is: %s \n', decoding_bin(xp,d)); 