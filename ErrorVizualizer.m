

clear all; clc; 

% Message à envoyer
my_mess = 'Bravo!'; 
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

%entré le pas
N = input ('Nombre de valeurs de pecrenterror testées: ');
h = 1/N;  %pas h

%choose from integers or countinuous
bool = input ('0 = continuous; 1 = integers: entrer le booleen: ');
if bool < 1
  fprintf('Vous avez choisi la solution relaxée du problème');
endif
if bool > 0
  fprintf('Vous avez choisi la résolution non continue (les variables xprime seront binaires)');
endif
for i =   1 : N 
  
  fprintf('Boucle numéro %d \n', i);
  percenterror = i*h;
  percentvector(i) = percenterror;
  fprintf('Percenterror is :%d \n', percenterror);
  yprime = noisychannel(y,percenterror); 
  
  [xprime,extra] = votrealgorithme(A,yprime,bool,n,m);
  for j= 1 : n 
    xp(j) = xprime(j);
    xp(j) = round (xp(j));
    %arrondir solution obtenue  
  endfor
  xp = vec(xp);
  err(i) = norm(x-xp);
  %timevect(i)= time;
  %fprintf('ProcessTime: %d \n',time);
  fprintf('The error is %d \n', norm(x-xp));  
  fprintf('The recovered message is: %s \n', decoding_bin(xp,d)); 
endfor 


plot (percentvector, err);
if bool < 1
  title ("Erreurs pour solution relaxée");
endif
if bool > 0
  title ("Erreurs pour la solutions non relaxée");
endif
xlabel ("percenterror");
ylabel ("error");





  
  