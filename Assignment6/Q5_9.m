clear all
close all
clc
Nodes_coordinates = [1,1 ; -1,1 ; -2,-1 ; 2,-1];
s = size(Nodes_coordinates);
for i = 1:s(1)
    x(i) = Nodes_coordinates(i,1);
    y(i) = Nodes_coordinates(i,2);
end

x
y

[Shape_functions ,derivative_shapefunction_x,derivative_shapefunction_y] = CompNDNatPointsQuad4(x,y);
%Shape functions 
%Answer of 5.9(a)
Shape_functions
N = Shape_functions;

%Answer of 5.9(b)
%Derivatives with respect to x
derivative_shapefunction_x
%Derivatives with respect to y
derivative_shapefunction_y

%Answer 5.9 (c)
%First Part
p1 = [1,-1];
%jacobian = CompJacobian2D(p1,derivative_shapefunction_x,derivative_shapefunction_y);

size(N)
size(x)

Ni_mul_x = (N)*(x) ;
Ni_mul_x





