clc; 
clear;
close all;
syms x y

%Calculations for the same have been completed in the attached pdf
Shape_function(1) =(x*(x+1)*y*(y+1)/4);
Shape_function(2) = x*(x-1)*y*(y+1)/4;
Shape_function(3) = x*(x-1)*y*(y-1)/4;
Shape_function(4) = x*(x+1)*y*(y-1)/4;
Shape_function(5) = -(x+1)*(x-1)*y*(y+1)/2;
Shape_function(6) = -x*(x-1)*(y+1)*(y-1)/2;
Shape_function(7) = -(x+1)*(x-1)*y*(y-1)/2;
Shape_function(8) = -x*(x+1)*(y+1)*(y-1)/2;
Shape_function(9) = (x+1)*(x-1)*(y+1)*(y-1);

%The respective shape functions have been plotted 

for i = 1:9
    figure (i);
fsurf(Shape_function(i),[-1,1,-1,1]);
end






