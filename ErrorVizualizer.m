

clear all; clc; 

% Message à envoyer
my_mess = 'Vous'; 
fprintf('The encoded message is: %s \n', my_mess)

% Message sous forme binaire
[x,d]  = encoding_bin(my_mess); 

% Longeur du message
N = length(x);

% Longeur du message qui va être envoyé
m = 4*N; 

% Matrice d'encodage: on prend une matrice aléatoirement générée
A = randn(m,N); 

% Message que l'on désire envoyer
y = A*x; 

% Bruit ajouté par le canal de transmition
% = normale N(0,sigma) pour un % des entrées de y

%entré le pas
n=120;
h = 1/200;

%choose from integers or countinuous
bool = input ('0 = continuous; 1 = integers: entrer le booleen: ');
if bool < 1
  fprintf('Vous avez choisi la solution relaxée du problème');
endif
if bool > 0
  fprintf('Vous avez choisi la résolution non continue (les variables seront binaires)');
endif
for i =   1 : n
  
  fprintf('Boucle numéro %d \n', i);
  percenterror = 0.3 + i*h;
  percentvector(i) = percenterror;
  fprintf('Percenterror is %d \n', percenterror);
  yprime = noisychannel(y,percenterror); 
  
  [xprime,n] = votrealgorithme(A,yprime,bool);
  
  for k= 1:N
    %xprime (k) = round (xprime(k));
    %arrondir solution obtenues (xi)
    xp(k)=xprime(k);
  endfor  
  if i<2
    err1 = norm (x-xp);
  endif       
  fprintf('The error is %d \n', norm(x-xp) - err1);  
  err(i) = norm(x-xp) - err1;
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
  
  