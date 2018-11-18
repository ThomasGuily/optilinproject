% Projet d'optimisation non lin�aire
%
% Envoi d'un message crypt� � travers un canal avec du bruit qaussien...
% 
% Encodez vous-m�me et d�chiffrez un message: 

clear all; clc; 
 
% Message � envoyer
my_mess = 'Bravo !'; 
fprintf('The encoded message is: %s \n', my_mess)

% Message sous forme binaire
[x,d]  = encoding_bin(my_mess); 

% Longeur du message
n = length(x);

% Longeur du message qui va �tre envoy�
m = 4*n; 

% Matrice d'encodage: on prend une matrice al�atoirement g�n�r�e
A = randn(m,n); 

% Message que l'on d�sire envoyer
y = A*x; 

% Bruit ajout� par le canal de transmition
% = normale N(0,sigma) pour un % des entr�es de y
percenterror =0.3;
yprime = noisychannel(y,percenterror); 



bool = 0;
%fprintf('The recovered message is: %s \n', decoding_bin(yprime,d)); %pour observer que le message ne peut �tre r�cup�rer


% Retrouvez x approximativement depuis yprime en r�solvant: 
% 
%   min_{0 <= xprime <= 1} ||A*xprime - yprime||_2^2 
 
[xprime] = votrealgorithme(A,yprime,bool,n,m); 



for j= 1 : n 
    xp(j) = xprime(j);
    xp(j) = round (xp(j));
    %arrondir solution obtenue  
endfor
xp = vec(xp);

fprintf('The error is %d \n', norm(x-xp)); 
fprintf('The recovered message is: %s \n', decoding_bin(xp,d));   