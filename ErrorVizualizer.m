

clear all; clc; 

% Message � envoyer
my_mess = 'Vous'; 
fprintf('The encoded message is: %s \n', my_mess)

% Message sous forme binaire
[x,d]  = encoding_bin(my_mess); 

% Longeur du message
N = length(x);

% Longeur du message qui va �tre envoy�
m = 4*N; 

% Matrice d'encodage: on prend une matrice al�atoirement g�n�r�e
A = randn(m,N); 

% Message que l'on d�sire envoyer
y = A*x; 

% Bruit ajout� par le canal de transmition
% = normale N(0,sigma) pour un % des entr�es de y

%entr� le pas
n=120;
h = 1/200;

%choose from integers or countinuous
bool = input ('0 = continuous; 1 = integers: entrer le booleen: ');
if bool < 1
  fprintf('Vous avez choisi la solution relax�e du probl�me');
endif
if bool > 0
  fprintf('Vous avez choisi la r�solution non continue (les variables seront binaires)');
endif
for i =   1 : n
  
  fprintf('Boucle num�ro %d \n', i);
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
  title ("Erreurs pour solution relax�e");
endif
if bool > 0
  title ("Erreurs pour la solutions non relax�e");
endif
xlabel ("percenterror");
ylabel ("error");
  
  