clear all
close all
clc

syms x 
syms E1 E2 E3

a = 175*10^(-12);
b = 400*10^(-12);
c = 590*10^(-12);

t1 = 5*10^(6);
t2 = t1;
t3 = 3*10^(6);

d = [0 0 0 0 c 0 ; 0 0 0 c 0 0 ; a a b 0 0 0];
t = transpose([t1 t2 t3 0 0 0]);

p = (d) * (t);

permit = [ (1.6 * 10^(-8)) 0 0 ; 0 (1.48 * 10^(-8)) 0 ; 0 0 x] ;

E = transpose([E1,E2,E3]);

J = - (p)* (inv(permit))

