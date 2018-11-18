% Projet d'optimisation non linéaire
%
% Envoi d'un message crypté à travers un canal avec du bruit qaussien...
% 
% Encodez vous-même et déchiffrez un message: 

clear all; clc; 
 
% Message à envoyer
my_mess = 'je vous félicite!'; 
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



bool = input ('0 = continuous; 1 = integers: entrer le booleen: ');
if bool < 1
  fprintf('Vous avez choisi la solution relaxée du problème %d \n');
endif
if bool > 0
  fprintf('Vous avez choisi la résolution non continue (les variables seront binaire) %d \n');
endif
%fprintf('The recovered message is: %s \n', decoding_bin(yprime,d)); %pour observer que le message ne peut être récupérer


% Retrouvez x approximativement depuis yprime en résolvant: 
% 
%   min_{0 <= xprime <= 1} ||A*xprime - yprime||_2^2 
 
[xprime,n] = votrealgorithme(A,yprime,bool); 

xp = zeros (n,1);

for i= 1:n
  xprime (i) = round (xprime(i));
  %arrondir solution obtenues (xi)
  xp(i)=xprime(i);
endfor

%arrondir chacunes valeurs du vecteurs trouvé (énoncer)

fprintf('The error is %d \n', norm(x-xp)); 
fprintf('The recovered message is: %s \n', decoding_bin(xp,d));   