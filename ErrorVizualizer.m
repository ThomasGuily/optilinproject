%cette fonction permet de visualiser les erreurs en fonction du pourcentage d'entr�es perturb�es.
%Aussi bien dans le cas continu que entier

clear all; clc; 

% Message � envoyer
my_mess = 'Bravo!'; 
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

%entr� le pas
N = input ('Nombre de valeurs de pecrenterror test�es: ');
h = 1/N;  %pas h

%choose from integers or countinuous

bool = input ('0 = continuous; 1 = integers: entrer le booleen: ');
if bool < 1
  fprintf('Vous avez choisi la solution relax�e du probl�me');
endif
if bool > 0
  fprintf('Vous avez choisi la r�solution non continue (les variables xprime seront binaires)');
endif
%choisir entre binaire ou relaxation

for i =   1 : N 
  
  fprintf('Boucle num�ro %d \n', i);
  percenterror = i*h;
  % N valeur de percenteror vont �tre test�es (progression lin�raire)
  
  percentvector(i) = percenterror;
  % reprise des valeurs de percenterror dans un vecteur afin de plot le r�sultat
  fprintf('Percenterror is :%d \n', percenterror);
  yprime = noisychannel(y,percenterror); 
  [xprime,extra] = votrealgorithme(A,yprime,bool,n,m);
  
  for j= 1 : n 
    xp(j) = xprime(j);
    %virer les ti inutiles
    xp(j) = round (xp(j));
    %arrondir solution obtenue  
  endfor
  xp = vec(xp);
  err(i) = norm(x-xp);
  %On reprend les erreurs absolues dans un vecteur afin de plot en fonction de percenteror
  
  fprintf('The error is %d \n', norm(x-xp));  
  fprintf('The recovered message is: %s \n', decoding_bin(xp,d)); 
endfor 


plot (percentvector, err);
if bool < 1
  title ("Erreurs pour solution relax�e");
endif
if bool > 0
  title ("Erreurs pour la solutions non relax�e");
endif
xlabel ("percenterror");
ylabel ("error");
%plot du r�sultat




  
  