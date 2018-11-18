% Projet d'optimisation non lin�aire
%
% Envoi d'un message crypt� � travers un canal avec du bruit qaussien...
% 
% Encodez vous-m�me et d�chiffrez un message: 

clear all; clc; 
 
% Message � envoyer
my_mess = 'je vous f�licite!'; 
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



bool = input ('0 = continuous; 1 = integers: entrer le booleen: ');
if bool < 1
  fprintf('Vous avez choisi la solution relax�e du probl�me %d \n');
endif
if bool > 0
  fprintf('Vous avez choisi la r�solution non continue (les variables seront binaire) %d \n');
endif
%fprintf('The recovered message is: %s \n', decoding_bin(yprime,d)); %pour observer que le message ne peut �tre r�cup�rer


% Retrouvez x approximativement depuis yprime en r�solvant: 
% 
%   min_{0 <= xprime <= 1} ||A*xprime - yprime||_2^2 
 
[xprime,n] = votrealgorithme(A,yprime,bool); 

xp = zeros (n,1);

for i= 1:n
  xprime (i) = round (xprime(i));
  %arrondir solution obtenues (xi)
  xp(i)=xprime(i);
endfor

%arrondir chacunes valeurs du vecteurs trouv� (�noncer)

fprintf('The error is %d \n', norm(x-xp)); 
fprintf('The recovered message is: %s \n', decoding_bin(xp,d));   