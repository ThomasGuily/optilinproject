clear all; clc;

load ('messagedAlice'); 

xprime = votrealgorithme(A,yprime); 

%fprintf('The error is %d \n', norm(x-xprime)); 
fprintf('The recovered message is: %s \n', decoding_bin(xprime,d)); 