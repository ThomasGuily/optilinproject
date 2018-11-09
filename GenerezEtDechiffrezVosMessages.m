% Projet d'optimisation non linéaire
%
% Envoi d'un message crypté à travers un canal avec du bruit qaussien...
% 
% Encodez vous-même et déchiffrez un message: 

clear all; clc; 
 
% Message à envoyer
my_mess = 'Alice dit merci !'; 
fprintf('The encoded message is: %s \n', my_mess)

% Message sous forme binaire
[x,d]  = encoding_bin(my_mess); 

% Longeur du message
n = length(x);

% Longeur du message qui va être envoyé
m = 4*n; 

% Matrice d'encodage: on prend une matrice aléatoirement générée
A = randn(m,n); 

% Message que l'on désire envoyer
y = A*x; 

% Bruit ajouté par le canal de transmition
% = normale N(0,sigma) pour un % des entrées de y
percenterror =0.3;
yprime = noisychannel(y,percenterror); 

% Retrouvez x approximativement depuis yprime en résolvant: 
% 
%   min_{0 <= xprime <= 1} ||A*xprime - yprime||_2^2 
 
xprime = votrealgorithme(A,yprime); 

xp = zeros (n,1);

for i= 1:n
  xprime (i) = round (xprime(i));
  xp(i)=xprime(i);
endfor
%arrondir chauques valeurs du vecteurs trouver (énoncer)

fprintf('The error is %d \n', norm(x-xp)); 
fprintf('The recovered message is: %s \n', decoding_bin(xp,d));   