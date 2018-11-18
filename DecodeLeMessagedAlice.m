% Projet d'optimisation non lin�aire
%
% D�codez le message d'Alice... 

clear all; clc; 
addpath ('C:/Inge/avoir/opti/lin');
% load la matrice d'encodage et le message d'Alice transmis par le canal: 
load ('messagedAlice.mat'); 

bool = input ('0 = continuous; 1 = integers: entrer le booleen: ');
if bool < 1
  fprintf('Vous avez choisi la solution relax�e du probl�me');
endif
if bool > 0
  fprintf('Vous avez choisi la r�solution non continue (les variables seront binaires)');
endif
% Utilisez votre algorithme pour r�soudre:
% 
%   min_{0 <= xprime <= 1} ||A*xprime - yprime||_2^2 
%
% Rem. La solution xprime devrait �tre un vecteur de taille 98x1
[xprime,n] = votrealgorithme(A,yprime,bool);
 


for i= 1:n 
  xprime (i) = round (xprime(i));
  xp(i)=xprime(i);
endfor
%virer les ti inutiles

% Affichez le r�sultat: 
fprintf('The recovered message is: %s \n', decoding_bin(xprime,d)); 