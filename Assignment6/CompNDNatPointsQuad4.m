%2d (4 Node) square master element

%Compute the 
% (i) shape functions 
% (ii) Derivatives of the shape functions

%Input Scheme:
%xi_vector, eta_vector: Coordinates of input points

%Output Scheme
%Matrix storing the shape functions values with the format
% N : Order (4X4) 
% [ N1(xi_1 , eta_1) N1(xi_2 , eta_2) N1(xi_3 , eta_3) N1(xi_4 , eta_4)
%   N2(xi_1 , eta_1) N2(xi_2 , eta_2) N2(xi_3 , eta_3) N2(xi_4 , eta_4)
%   N3(xi_1 , eta_1) N3(xi_2 , eta_2) N3(xi_3 , eta_3) N3(xi_4 , eta_4) 
%   N4(xi_1 , eta_1) N4(xi_2 , eta_2) N4(xi_3 , eta_3) N4(xi_4 , eta_4)]

%Output: Nx, Ny (Derivatives calculated )

function [N,Nx,Ny] = CompNDNatPointsQuad4(xi_vector , eta_vector)
%Column Matrix Formations (size of xi_vector = size of eta_vector) 
np = size(xi_vector , 1);

% Setting up & Initializing Empty Matrices
%Shape fucnction matrix
N = zeros(4,np);
%shape functions derivative with respect to x
Nx = zeros(4,np);
%Shape functions derivative with respect to y
Ny = zeros(4,np);

%Coordinates of the master nodes
%Coordinates: (1,1) (-1,1) (-1,-1) (1,-1)
master_nodes = [1 1; -1 1; -1 -1 ; 1 -1];

%Computation of Shape Functions i.e N Matrix

%Our Iterating Variable 
for j = 1:np
    xi = xi_vector(j);
    eta = eta_vector(j);
    for i = 1:4
        nx = master_nodes(i,1);
        ny = master_nodes(i,2);
        N(i,j) = (1.0 + nx*xi) * (1.0 + ny*eta)/4.0 ;
        Nx(i,j) = nx*(1.0 + ny*eta)/4.0;
        Ny(i,j) = ny*(1.0 + nx*xi)/4.0;
    end
end

end